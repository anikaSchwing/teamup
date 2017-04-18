class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = current_user.match_1 + current_user.match_2
  end
end
