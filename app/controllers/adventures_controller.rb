class AdventuresController < ApplicationController
    
    def create
        @adventure = Adventure.new(params[:adventure].permit(:title, :author, :pages_attributes =>[:name, :text]))
        if @adventure.save
            redirect_to @adventure
        else
            render 'new'
        end
    end

    def new
        @adventure = Adventure.new
    end

    def show
        @adventure = Adventure.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @adventure}
        end
    end
end
