class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)

    #find the library
    library = Library.find(library_id)

    #find the library's libraries
    lib_response = Typhoeus.get("#{library.url}/libraries.json")

    if lib_response != []

      lib_result = JSON.parse(lib_response.body)

      lib_result['libraries'].each do |lib| 
        # only create libraries that don't already exist in my library.
        if Library.where(url: lib["url"]) == []
          Library.create(url: lib["url"])
        end
      end

    end #if

  end #def

end #class