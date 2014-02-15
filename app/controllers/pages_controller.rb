class PagesController < ApplicationController

    def create
        new_page = params.require(:bid).permit(:name, :text)
        adventure = Adventure.find(params[:adventure_id])
        page = Adventure.pages.create(new_page)
        redirect_to adventure_page_path(@adventure, @bid)
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
