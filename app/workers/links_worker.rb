class LinksWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    response = Typhoeus.get("#{library.url}adventures.json")
    result = JSON.parse(response.body)
    result["adventures"].each do |adventure|
      obtained_library = library.adventures.create!(:title => adventure["title"], :author => adventure["author"],
        :guid => adventure["guid"])
        adventure["pages"].each do |page|
          obtained_page = obtained_library.pages.create!(:name => page["name"], :text => page["text"])
        end
    end
  end

end