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

    end

    def edit

    end
    
    def update

    end

    def delete
        
    end

end