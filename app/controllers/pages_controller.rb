class PagesController < ApplicationController
    def  index
        @adventure = Adventure.find(params[:adventure_id])
        @page = @adventure.pages
        respond_to do |format|
            format.html
            format.json {render json: @page}
        end
    end

    def create
        new_page = params.require(:page).permit(:name, :text)
        adventure = Adventure.find(params[:adventure_id])
        page = adventure.pages.create(new_page)
        redirect_to new_adventure_page_path#(@adventure, @page)
    end

    def new
        @adventure = Adventure.find(params[:adventure_id])
        @page = @adventure.pages.build
    end

    def show
        @adventure = Adventure.find(params[:adventure_id])
        @page = @adventure.pages.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @page}
        end
    end
end
