class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :new_user_session unless current_user && current_user.admin?
  end

  layout 'admin'

  def index
    all_matches = Match.all
    @matches = all_matches.group_by(&:day)
  end

  def create
    requested_day = params[:day]
    removeExistingMatches(requested_day)
    createMatches(requested_day)
  end

end

private
    def matchStudents()
      matched_students = []
      all_students = User.where(admin:false)

      all_students.each do |student|
        if (!matched_students.flatten.include?(student))
          second_student = findMatch(student, matched_students)
          matched_students << [student, second_student]
        end
      end
      return matched_students
    end

    def findMatch(student, matched_students)
      students = User.where(admin:false).where.not(id: student.id)
      second_student = students[rand(students.length)]

      if (!matched_students.flatten.include?(second_student))
        return second_student
      else
        findMatch(student, matched_students)
      end
    end

    def createMatches(day)
      matched_students = matchStudents()
      success = false

      matched_students.each do |students|
        new_match = Match.create(day: day, student_1: students[0], student_2: students[1])
        success = true if new_match.save
      end

      redirect_to admin_matches_path, notice: "Matches created for #{day.to_date}" if success
    end

    def removeExistingMatches(day)
      todays_matches = Match.where(day: day)
      todays_matches.each { |match| match.destroy } if todays_matches.length > 0
    end
