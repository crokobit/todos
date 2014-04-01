class SessionsController < ApplicationController
  before_action :set_user, only:[:create]

  def new
    @user = User.new
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    elsif
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(name: params[:name])
  end
end
