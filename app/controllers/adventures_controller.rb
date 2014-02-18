class AdventuresController < ApplicationController
    
    def index
        @adventure = Adventure.all
        respond_to do |format|
            format.html
            format.json {render json: @adventure}
        end
    end

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

    # def update
    #     updated_adventure = params.require(:page).permit(:name, :text)
    #     page = adventure.pages.find(params[:id])
    #     page.update_attributes(updated_adventure)
    #     redirect_to new_adventure_page_path
    # end
end