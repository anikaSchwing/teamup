class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :matches unless current_user && current_user.admin?
  end

  def index
    @matches = Match.all
  end
end
