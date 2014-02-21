class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    response = Typhoeus.get("#{library.url}libraries.json")
    result = JSON.parse(response.body)
    result["libraries"].each do |library|
      obtained_library = library.create!(:url => library["url"])
    end
  end

end