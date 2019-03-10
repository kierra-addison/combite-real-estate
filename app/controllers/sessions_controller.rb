class SessionsController < ApplicationController
  before_action :require_no_user, except: [:destroy]

  def new
  end

  def create
    p params[:username]
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:notice] = 'Invalid username or password.'
      redirect_to admin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out.'
    redirect_to admin_path
  end
end
