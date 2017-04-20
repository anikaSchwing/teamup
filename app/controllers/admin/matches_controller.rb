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

    @all_students = User.where(admin:false)
    @previous_matches = Array.new
    Match.all.each do |match|
      @previous_matches << [match.student_1, match.student_2]
    end

    createMatches(requested_day)
  end
end

private
    def newMatches
      new_matches = []
      current_set = Array.new(@all_students)
      current_set.shuffle!

      while current_set.length > 1 do
        first_student = current_set.shift()
        second_student = current_set.shift()

        new_matches << [first_student, second_student]
      end
      return new_matches
    end

    def existingMatch?(new_matches)
      existing_match = false
      new_matches.each do |match|
        match = Array.new(match)
        if (@previous_matches.include?(match) || @previous_matches.include?(match.reverse))
          existing_match = true
        end
      end
      return existing_match
    end

    def createMatches(day)
      success = false
      new_matches = newMatches()
      possible_matches = (@all_students.length-1) * (@all_students.length/2)

      if(existingMatch?(new_matches) && (@previous_matches.length < possible_matches))
        createMatches(day)
      else
        new_matches.each do |students|
          success = true if Match.create(day: day, student_1: students[0], student_2: students[1])
        end
      end
      redirect_to admin_matches_path, notice: "Matches created for #{day.to_date}" if success
    end
