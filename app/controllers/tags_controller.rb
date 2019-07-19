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
    end

    def edit
        @tag = Tag.find(params[:id])
        @board = Board.find(params[:board_id])
        binding.pry
    end

    def update
        @tag = Tag.find(params[:id])
        @board = Board.find(params[:tag][:board_id])
        @family = @board.family
        if @tag.update(tag_params)
            redirect_to @family
        else
            render :edit
        end
    end

    private

    def tag_params
        params.require(:tag).permit(:content, :board_id)
    end
end