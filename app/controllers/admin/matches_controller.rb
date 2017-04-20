class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :new_user_session unless current_user && current_user.admin?
  end
  layout 'admin'

  def index
    puts 'getting all grouped matches'
    @matches = Match.all.group_by(&:day)
  end

  def create
    @all_students = User.where(admin:false)
    @previous_matches = Match.getMatches()
    createMatches(params[:day])
  end
end

private
    def createMatches(day)
      success = false
      new_matches = Match.newMatches()
      possible_matches = (@all_students.length-1) * (@all_students.length/2)

      if(Match.existingMatch(new_matches) && (@previous_matches.length < possible_matches))
        createMatches(day)
      else
        new_matches.each do |students|
          success = true if Match.create(day: day, student_1: students[0], student_2: students[1])
        end
        redirect_to admin_matches_path, notice: "Matches created for #{day.to_date}" if success
      end
    end
