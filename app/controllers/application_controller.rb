class ApplicationController < ActionController::API
    before_action :authenticate
    
    def authenticate
        if !request.headers['Authorization']
            render json: {error: 'Use Bearer Auth'}, status: :forbidden
        else

            begin
                token = request.headers['Authorization'].split(' ')[1]
                secret = 'secret'
                decoded_token = JWT.decode token, secret
                payload = decoded_token.first
                user_id = payload['user_id']
                @user = User.find user_id  
            rescue
                render json: {error: 'Invalid Token'}, status: :forbidden
                
            end

        end
    end
end
