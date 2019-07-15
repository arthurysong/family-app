class RolesController < ApplicationController

    def new
        @role = Role.new
        @family = Family.find(params[:family_id])
        #binding.pry
    end


end