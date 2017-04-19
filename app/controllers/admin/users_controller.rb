class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to :new_user_session unless current_user && current_user.admin?
  end

  layout 'admin'

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :admin_users, notice: "User updated"
    else
      render 'index'
    end
  end

end

private
    def user_params
      params.permit(:name, :email, :admin)
    end
