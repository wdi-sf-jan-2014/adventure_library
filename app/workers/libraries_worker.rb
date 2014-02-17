class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)

  #to get that library's local adventures
    library = Library.find(library_id)
    lib_link = library.url
    if (lib_link.ends_with? '/')
    	lib_link = lib_link.concat('adventures.json')
    end

    if (lib_link.ends_with? 's')
    	lib_link = lib_link.concat('/adventures.json')
    end

    response = Tyhphoeus.get("lib_link")
    result = JSON.parse(response.body)
    binding.pry
  end
end