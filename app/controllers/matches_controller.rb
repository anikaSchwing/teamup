class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :admin_matches if current_user && current_user.admin?
  end

  def index
    @matches = current_user.match_1 + current_user.match_2
    @matches.sort_by!()
  end
end
