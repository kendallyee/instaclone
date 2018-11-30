class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      redirect_to '/login'
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/login', notice: "Logged out!"
    end


end
