class BoardsController < ApplicationController
    before_action :require_login, :redirect_if_user_is_not_authorized

    def edit
        @board = Board.find(params[:id])
    end

    def update
        @board = Board.find(params[:id])
        if @board.update(board_params)
            redirect_to family_path(@board.family)
        else
            render 'boards/edit'
        end
    end

    private

    def board_params
        params.require(:board).permit(:header)
    end

    def  redirect_if_user_is_not_authorized
        board = Board.find(params[:id])
        if !(current_user.parent_of_this_family?(board.family))
            redirect_to family_path(board.family)
        end
    end
end