class TagsController < ApplicationController
    def create
        binding.pry
        
    end

    private

    def tag_params
        params.require(:tag).permit(:content, :board_id)
    end
end