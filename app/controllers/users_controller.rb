class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :profile, :update]

    def index
        render json: User.all
    end 

    def profile
      token = request.headers['Authorization'].split(' ')[1]
      decoded_token = JWT.decode token, 'bigwetass', true, { algorithm: 'HS256' }
      user_id = decoded_token[0]['user_id']
      user = User.find(user_id)
  
      if user
        render json: { user: UserSerializer.new(user) }
      else
        render json: { error: 'Invalid token.'}, status: 401
      end

    end 


    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
      @user = User.find_by(id: params[:id])
      @user.update(name: params[:name], email: params[:email], current_goal: params[:currentGoal])
      if @user.valid?
        render json: { user: UserSerializer.new(@user)}
      else
        render json: { error: 'failed to update user' }
      end
  end
    
     
    private
    def user_params
       params.require(:user).permit(:name, :email, :password, :current_goal)
    end
end
