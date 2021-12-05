class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.email}!"
      redirect_to '/dashboard'
    else
      flash[:error] = 'Sorry, your credentials are bad.'
      render :new
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
