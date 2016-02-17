class ShoesController < ApplicationController
    before_action :require_login
    before_action :set_user

  def index
    @shoes = Shoe.all
  end

  def create
    shoe = @user.shoes.create(shoe_params)
    if shoe.save
    else
        flash[:errors] = shoe.errors.full_messages
    end
    redirect_to "/users/#{session[:user_id]}"
  end


  def destroy
    shoe = Shoe.find(params[:id])
    shoe.destroy if shoe.user == current_user
    redirect_to "/users/#{session[:user_id]}"
  end


  private

    def set_user
      @user = User.find(session[:user_id])
    end
    def shoe_params
      params.require(:shoe).permit(:name, :amount)
    end
end
