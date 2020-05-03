class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user # && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Bad email. Try again.'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
