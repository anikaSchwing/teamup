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
    def newMatches
      new_matches = []
      current_set = Array.new(@all_students.order("RANDOM()"))

      while current_set.length > 1 do
        first_student = current_set.shift()
        second_student = current_set.shift()

        new_matches << [first_student, second_student]
      end
      return new_matches
    end

    def createMatches(day)
      @all_students = User.where(admin:false)
      puts @all_students
      success = false
      matched_students = newMatches()

      matched_students.each do |students|
        success = true if Match.create(day: day, student_1: students[0], student_2: students[1])
      end

      redirect_to admin_matches_path, notice: "Matches created for #{day.to_date}" if success
    end

    def removeExistingMatches(day)
      todays_matches = Match.where(day: day)
      todays_matches.each { |match| match.destroy } if todays_matches.length > 0
    end
