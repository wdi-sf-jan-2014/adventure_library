class LibrariesController < ApplicationController
    def index
        @adventure = Adventure.all
        @library = Library.all
        respond_to do |format|
            format.html
            format.json {render json: @library}
        end
    end

    def new
        @library = Library.new
    end

    def create
        new_library = params.require(:library).permit(:url)
        url = new_library.url
        response = Typhoeus.get(url)
        libraries_as_json = JSON.parse(response.body)
        libraries_as_json["libraries"].each do |lib|
            library = Library.find_or_create_by(url: lib["url"])
            if(library)
                LibrariesWorker.perform_async(library.id)
            end
        end
    end

        @library = Library.find_or_create_by(new_library)
        if (@library)
            url = @library.url
            response = Typhoeus.get(library)
            parsed = JSON.parse(response.body)
        end
        # LibrariesWorker.perform_async(@library.id)
    end

    def show
        @library = Library.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @library}
        end
    end
end
