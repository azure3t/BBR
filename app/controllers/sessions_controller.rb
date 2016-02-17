class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    puts "loginging"
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/shoes'
    else
      flash[:errors] = ["Invalid log In info"]
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end


end

