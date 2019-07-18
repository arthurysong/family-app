class FamiliesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    
    def index
        @families = Family.all
    end


    def show
        #binding.pry
        @family = Family.find(params[:id])
        @tag = Tag.new
        #binding.pry
    end

    def new
        @family = Family.new
    end

    def create
        @family = Family.create(family_params)


        board = Board.create()
        @family.board = board
        if params[:header] != ""
            board.header = params[:header]
            board.save
        end
        @family.save

        role = Role.create(title: params[:title])
        role.family = @family
        role.user = current_user
        role.save
        

        if @family.valid?
            #binding.pry
            redirect_to @family
        else
            render 'families/new'
        end
    end

    def edit
        authorize_user_for_family_edit
        @family = Family.find(params[:id])
    end

    private

    def family_params
        params.require(:family).permit(:last_name, :password, :password_confirmation)
    end

    def authorize_user_for_family_edit
        family = Family.find(params[:id])
        #binding.pry
        if !(current_user.parent_of_this_family?(family))
            redirect_to family
        end
    end
end