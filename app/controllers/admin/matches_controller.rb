class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :new_user_session unless current_user && current_user.admin?
  end

  def index
    all_matches = Match.all
    @matches = all_matches.group_by(&:day)
  end
end
