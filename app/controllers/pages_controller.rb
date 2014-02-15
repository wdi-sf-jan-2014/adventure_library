class PagesController < ApplicationController
    def create
    end

    def new
        @page = Page.all
    end

    def show
        @adventure = Adventure.find(params[:adventure_id])
        @page = @adventure.page.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @page}
        end
    end
end
