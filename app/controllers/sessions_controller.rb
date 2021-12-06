class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to '/dashboard'
    else
      flash[:error] = 'Invalid Email or Password'
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
