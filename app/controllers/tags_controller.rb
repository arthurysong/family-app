class TagsController < ApplicationController
    def create
        
        family = Board.find(params[:tag][:board_id]).family
        tag = Tag.create(tag_params)
        tag.role = current_user.my_role_in_this_family(family)
        tag.save

        redirect_to family

        #binding.pry
    end

    private

    def tag_params
        params.require(:tag).permit(:content, :board_id)
    end
end