class FamiliesController < ApplicationController
    def index
        @families = Family.all
    end


    def show
        @family = Family.find(params[:id])
    end

    def new
        @family = Family.new
    end

    def create
        @family = Family.create(family_params)
        @family.board = Board.create()
        role = Role.create(title: params[:title])
        role.family = @family
        role.user = current_user
        role.save

        if @family.valid?
            redirect_to @family
        else
            render 'families/new'
        end
    end


    private

    def family_params
        params.require(:family).permit(:last_name, :password, :password_confirmation)
    end
end