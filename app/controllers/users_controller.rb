class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
        render json: User.all
    end 

    def create
        @user = User.create(user_params)
        if @user.valid?
          render json: @user
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
     
    private
    def user_params
       params.require(:user).permit(:name, :email, :password, :current_goal)
    end
end
