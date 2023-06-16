class UsersController < ApplicationController 
    before_action :require_logged_in, only: [:index, :show]
    before_action :require_logged_out, only: [:new, :create]

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end

    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end 