class TagsController < ApplicationController
    def create
        require_login
        @family = Board.find(params[:tag][:board_id]).family
        if !(@family.users.include?(current_user))
            redirect_to @family and return
        end

        @tag = Tag.create(tag_params)
        @tag.user = current_user
        if @tag.save
            redirect_to @family
        else
            render "families/show"
        end
        #binding.pry
    end

    private

    def tag_params
        params.require(:tag).permit(:content, :board_id)
    end
end