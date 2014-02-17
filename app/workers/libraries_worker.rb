class LibrariesWorker
  include Sidekiq::Worker
  include LibrariesHelper

  def perform(lib_id)
    library = Library.find(lib_id)

    scrape(library.url)

    @foreign_adventures.each do |x|
      
      unless Adventure.find_by(guid: x["guid"])
        this_adventure = library.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])

        x["pages"].each do |y|
          this_adventure.pages.create(name: y["name"], text: y["text"])
        end
      end
    end

    @foreign_libraries.each do |lib|
      clean_url = url_cleanup(lib["url"])
      unless Library.find_by(url: clean_url)
        library = Library.create(url: clean_url)
        perform(library.id)
      end
    end
  end

end