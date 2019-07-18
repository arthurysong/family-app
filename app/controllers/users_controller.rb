class UsersController < ApplicationController

    def new
        require_logout
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else
            #binding.pry
            render 'users/new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        require_login
        authorize_user_for_edit

        @user = User.find(params[:id])
    end

    def update
        require_login
        authorize_user_for_edit

        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else
            render 'users/edit'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :password, :password_confirmation)
    end

    def require_logout
        if logged_in?
            redirect_to current_user
        end
    end

    def authorize_user_for_edit
        user = User.find(params[:id])
        if current_user != user
            redirect_to current_user
        end
    end
end