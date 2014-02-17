class LibrariesController < ApplicationController
    def index
        @adventure = Adventure.all
        @libraries = Library.all
        @library = Library.new
        respond_to do |format|
            format.html
            format.json {render json: @library}
        end
    end

    def new
        @library = Library.new
    end

    def create
        @library = Library.new
        new_library = params.require(:library).permit(:url)
        url = new_library["url"]
        response = Typhoeus.get(url)
        libraries_as_json = JSON.parse(response.body)
        libraries_as_json["libraries"].each do |lib|
            library = Library.find_or_create_by(url: lib["url"])
            if(library)
                LibraryWorker.perform_async(library.id)
            end
        end
        redirect_to @library
    end

    def show
        @library = Library.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @library}
        end
    end
end
