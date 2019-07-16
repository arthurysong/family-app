class RolesController < ApplicationController

    def new
        #@role = Role.new
        @family = Family.find(params[:family_id])
        @role = Role.new
        #binding.pry
    end

    def create
        #binding.pry
        @family = Family.find(params[:family_id])
        @role = Role.new(role_params)

        if !!@family.password_digest
            if !@family.authenticate(params[:password])
                flash[:notice] = "Wrong password"
                return render 'roles/new'
            end
        end
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
        Role.find(params[:id]).destroy
        redirect_to family_path(Family.find(params[:family_id]))
    end


    private

    def role_params
        params.permit(:title)
    end


end