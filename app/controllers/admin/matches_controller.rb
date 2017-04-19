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
    createMatches(requested_day)
  end

end

private
    def matchStudents()
      matched_students = []

      first_student = User.where(admin:false).first
      second_student = findMatch(first_student)

      matched_students << [first_student, second_student]
    end

    def findMatch(first_student)
      students = User.where(admin:false).where.not(id: first_student.id)
      second_student = students[rand(students.length)]
    end

    def createMatches(day)
      matched_students = matchStudents()

      matched_students.each do |students|
        new_match = Match.create(day: day, student_1: students[0], student_2: students[1])
      end

      redirect_to admin_matches_path, notice: "Matches created for #{day.to_date}"
    end
