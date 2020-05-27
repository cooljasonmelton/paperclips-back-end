class AuthController < ApplicationController
    skip_before_action :authorized, only: :create

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params['password'])
            @user.fill_missing_entries
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'Invalid username or password.'}, status: 401
        end
    end

end