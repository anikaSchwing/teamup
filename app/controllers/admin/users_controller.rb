class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :new_user_session unless current_user && current_user.admin?
  end

  def index
    @users = User.all
  end

end
