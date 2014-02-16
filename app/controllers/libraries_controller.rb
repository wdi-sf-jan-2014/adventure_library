class LibrariesController < ApplicationController
    def index
        @library = Library.all
        respond_to do |format|
            format.html
            format.json {render json: @library}
        end
    end

    def show
        @library = Library.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @library}
        end
    end
end
