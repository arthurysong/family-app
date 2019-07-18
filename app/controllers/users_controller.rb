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
        @user = User.find(params[:id])
        authorize_user_for_edit(@user)
    end

    def update
        require_login
        @user = User.find(params[:id])
        authorize_user_for_edit(@user)
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

    def authorize_user_for_edit(user)
        if current_user != user
            redirect_to user
        end
    end
end