class AuthenticationController < ApplicationController
    skip_before_action :authenticate, only: :login

    def login
        @user = User.find_by username: params[:username]

        if !@user
            render json: {error: 'Invalid username or password' }, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: {error: 'Invalid username or password'}, status: :unauthorized
            else

                payload = {user_id: @user.id}
                secret = 'secret'
                token = JWT.encode payload, secret

                render json:{
                    token: token, 
                    username: @user.username
                }
            end
        end
    end
end
