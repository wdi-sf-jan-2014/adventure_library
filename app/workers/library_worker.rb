class LibraryWorker
    include Sidekiq::Worker

    def perform(library_id)
        new_library = params.require(:library).permit(:url)
        url = new_library.url
        response = Typhoeus.get(url)
        libraries_as_json = JSON.parse(response.body)
        libraries_as_json["libraries"].each do |lib|
            library = Library.find_or_create_by(url: lib["url"])
            if(library)
                LibraryWorker.perform_async(library.id)
            end
        end
    end
end