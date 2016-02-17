class OrdersController < ApplicationController
    before_action :require_login

    def create
        shoe = Shoe.find(params['s_id'])
        order = Order.create(user: current_user, shoe: shoe)
        redirect_to "/users/#{session[:user_id]}"
    end
end
