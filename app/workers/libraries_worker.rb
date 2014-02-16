class LibrariesWorker
  include Sidekiq::Worker
  include LibrariesHelper

  def perform(lib_id)
    library = Library.find(lib_id)

    scrape(library.url)

    @foreign_adventures.each do |adv|
      new_adventure = {title: adv["title"], author: adv["author"], guid: adv["guid"]}

      # it'd be nice if this could also update attributes, but only if they'd changed
      unless Adventure.find_by(guid: adv["guid"])
        this_adventure = library.adventures.create(new_adventure)

        adv["pages"].each do |page|
          new_page = {name: page["name"], text: page["text"]}
          this_adventure.pages.create(new_page)
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

@foreign_libraries.each do |lib|
      if Library.find_by(url: lib["url"]).nil?
      new_lib = Library.create_or_find_by(url: lib["url"])

    end
    resp.each do |x|
      adv = lib.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])
      x["pages"].each do |y|
        adv.pages.create(name: y["name"], text: y["text"])
      end
    end
    redirect_to libraries_path