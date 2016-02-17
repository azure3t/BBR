class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :set_user, only: [:show,  :edit, :update, :destroy]

    def show
        @shoes = Shoe.all
    end

    def new
        session[:user_id] = nil
    end

    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to "/shoes"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to '/users/new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            puts "updated"
            redirect_to "/users/#{@user.id}"
        else
            puts "not updated"
            redirect_to "/users/#{@user.id}/edit"
        end
    end

    def destroy
        user = User.find(params[:id])
        puts "user is #{user}"
        user.destroy
        session[:user_id] = nil
        redirect_to new_user_path
    end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def set_user
      @user = User.find(session[:user_id])
    end

end
