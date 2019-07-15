class RolesController < ApplicationController

    def new
        #@role = Role.new
        @family = Family.find(params[:family_id])
        #binding.pry
    end

    def create
        @family = Family.find(params[:family_id])
        if !!@family.password_digest
            if !@family.authenticate(params[:password])
                render 'roles/new'
                flash[:notice] = "You have wrong password"
            end
        end

        role = Role.create(role_params)
        role.user_id = current_user.id
        role.family_id = @family.id
        role.save
        redirect_to @family
         
    end
    
    private

    def role_params
        params.permit(:title)
    end


end