class LibrariesWorker
  include Sidekiq::Worker
  include LibrariesHelper

  def perform(lib_id)
    library = Library.find(lib_id)

    scrape(library.url)

    @foreign_adventures.each do |x|
      new_adventure = {title: x["title"], author: x["author"], guid: x["guid"]}

      # it'd be nice if this could also update attributes, but only if they'd changed
      unless Adventure.find_by(guid: x["guid"])
        this_adventure = library.adventures.create(new_adventure)

        x["pages"].each do |y|
          this_adventure.pages.create(name: y["name"], text: y["text"])
        end
      end
    end

    @foreign_libraries.each do |lib|
      clean_url = url_cleanup(lib["url"])
      unless Library.find_by(url: clean_url)
        library = Library.create(url: clean_url)
        perform(library.id) #recursion allowing one pass to scrape all attached libraries -> My attempt missed this: Line 37
      end
    end
  end

end

# @foreign_libraries.each do |lib|
#       if Library.find_by(url: lib["url"]).nil?
#         new_lib = Library.create_or_find_by(url: lib["url"])
# >>My attempt would have failed because I did not have a method I could call upon in a recursive way.  Kai uses the perform method after new_lib is defined and that allows her methods to work versus run once.

#     end
#     resp.each do |x|
#       adv = lib.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])
#       x["pages"].each do |y|
#         adv.pages.create(name: y["name"], text: y["text"])
#       end
#     end
#     redirect_to libraries_path