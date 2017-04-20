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
    Match.getMatches
    Match.createMatches(params[:day])
    redirect_to admin_matches_path
  end
end
