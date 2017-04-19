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
      first_student = User.order("RANDOM()").first
      second_student = User.order("RANDOM()").second

      if (first_student != second_student)
        return first_student, second_student
      else
        return []
      end
    end

    def createMatches(day)
      matched_students = matchStudents()

      if (matched_students.length > 0)
        match = Match.create(day: day, student_1: matched_students[0], student_2: matched_students[1])

        if match.save
          redirect_to admin_matches_path, notice: "Match created for #{day.to_date}"
        else
          render :index
        end
      end
    end
