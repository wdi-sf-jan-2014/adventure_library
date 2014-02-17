module LibrariesHelper

  #
  # TODO - determine the proper location for this method
  #

  # adds a new library, or returns existing library if found
  def add_new_library(url)

    # if user entered url ending with a slash, remove it
    url.chop! if url.end_with?('/')

    # if library is already saved, return that library, else create a new one
    library = Library.find_by(url: url)
    if library.nil?
      library = Library.new(url: url) 
      library_list = library.scrape_libraries
      adventures_list = library.scrape_adventures

      unless library_list.empty? && adventures_list.empty?
        library.save
        save_adventures(library, adventures_list)
      else
        library = nil
      end

    end

    return library
  end

private

  def save_new_libraries(library_list)
  end

  def save_adventures(library, adventures_list)

    adventures_list.each do |adventure|
      # could potentially use from_json here, if you trusted the json you scraped.
      curr_adv = library.adventures.create(:title => adventure["title"],
                                      :author => adventure["author"],
                                      :guid => adventure["guid"])
      # store each page of the adventure
      adventure["pages"].each do |page|
        curr_adv.pages.create(:name => page["name"], :text => page["text"])
      end
    end
  end

end




