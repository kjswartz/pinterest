class SessionController < ApplicationController
  def signup
  end

  def signin
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'You signed in!'
    end
    redirect_to '/'
  end

  def signout
    session[:user_id] = nil
    flash[:notice] = 'You are signed out!'
    redirect_to '/'
  end
end
