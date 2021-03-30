class UsersController < ApplicationController
    skip_before_action :authenticate, only: :create
    def profile
        @users = User.all
        render json: {user:@user, users: @users}
    end

    def index
        @users = User.all
        render json: {user: @users}
    end

    def create
        @user = User.new(
            username: params[:username],
            password: params[:password],
            fullName: params[:fullName],
            mod: params[:mod],
            slackLink: params[:slackLink]
        )
        if @user.valid?
            @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end
end
