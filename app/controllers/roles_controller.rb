class RolesController < ApplicationController
    before_action :require_login

    def new
        #@role = Role.new
        @family = Family.find(params[:family_id])
        @role = Role.new
        #binding.pry
    end

    def create
        #binding.pry
        #binding.pry
        @family = Family.find(params[:family_id])
        @role = Role.new(role_params)

        if !!@family.password_digest
            if !@family.authenticate(params[:family][:password])
                flash[:notice] = "Wrong password"
                return render 'roles/new'
            end
        end
        #binding.pry
        #binding.pry
        @role.user_id = current_user.id
        @role.family_id = @family.id
        if @role.save
            redirect_to @family
        else
            render 'roles/new'
        end 
    end
    
    def destroy
        #binding.pry
        family = Family.find(params[:family_id])
        if !(family.users.include?(current_user))
            redirect_to family and return
        end

        binding.pry
        Role.find(params[:id]).destroy
        redirect_to family_path(Family.find(params[:family_id]))
    end


    private

    def role_params
        params.permit(:title)
    end
end