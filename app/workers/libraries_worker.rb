class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    lib_link = library.url
    response = Tyhphoeus.get("lib_link")
    binding.pry
    result = JSON.parse(response.body)
  end
end