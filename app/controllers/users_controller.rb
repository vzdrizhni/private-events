class UsersController < ApplicationController
  def new
    @user = current_user.users.build
  end

  def create

  end

  def show
    @user = User.find(params[:id])
  end
end
