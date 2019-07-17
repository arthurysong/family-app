class TagsController < ApplicationController
    def create
        family = Board.find(params[:tag][:board_id]).family
        if !(family.users.include?(current_user))
            redirect_to family and return
        end

        tag = Tag.create(tag_params)
        tag.user = current_user
        tag.save

        redirect_to family

        #binding.pry
    end

    private

    def tag_params
        params.require(:tag).permit(:content, :board_id)
    end
end