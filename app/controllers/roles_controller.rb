class RolesController < ApplicationController

    def new
        #@role = Role.new
        @family = Family.find(params[:family_id])
        #binding.pry
    end

    def create
        @family = Family.find(params[:family_id])
        if !!@family.password_digest
            if @family.authenticate(params[:password])
                role = Role.create(role_params)
                role.user_id = current_user.id
                role.family_id = @family.id
                role.save
                redirect_to @family
            else
                render 'roles/new'
                flash[:notice] = "You have wrong password"
            end
        end
         
    end
    
    private

    def role_params
        params.permit(:title)
    end


end