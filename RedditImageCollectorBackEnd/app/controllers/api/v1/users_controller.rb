class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        users = User.all
        render json: Api::V1::UserSerializer.new(users)
    end

    def create
        user = User.new(user_params)

        if user.valid?
            user.save()
            render json: Api::V1::UserSerializer.new(user)
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: Api::V1::UserSerializer.new(@user)
    end

    def update
        @user.attributes = user_params

        if @user.save
            render json: Api::V1::UserSerializer.new(@user)
        else 
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        user = @user.destroy

        render json: Api::V1::UserSerializer.new(user)
    end

    private

    def set_user
        @user = User.find params[:id]
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :nsfw_flag, :dark_mode)
    end

end