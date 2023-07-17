class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request, only: [:login]

    # POST /auth/login
    def login
        @user = Profile.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            render json: { token: token }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: unauthorized
        end
    end

    def whoami
        render json: { user: @current_user }
    end
end 
