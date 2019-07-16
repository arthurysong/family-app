class BoardsController < ApplicationController

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
end