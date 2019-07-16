class BoardsController < ApplicationController

    def edit
        @board = Board.find(params[:id])
    end

    def update

    end
end