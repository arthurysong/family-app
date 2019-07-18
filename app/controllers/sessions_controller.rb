class SessionsController < ApplicationController
    def new 

    end

    def create
        binding.pry
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id

            redirect_to user
        else
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user
            else
                flash[:notice] = "Invalid email and password combination"
                render 'sessions/new'
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end


end