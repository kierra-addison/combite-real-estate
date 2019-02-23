class SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]

  def new
  end

  def create
    p params[:username]
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:notice] = 'Invalid username or password.'
      redirect_to admin_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out.'
    redirect_to admin_url
  end
end
