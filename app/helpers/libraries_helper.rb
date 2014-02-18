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
        library.add_adventures(adventures_list)
      else
        library = nil
      end

    end

    return library
  end

  def add_other_libraries(library)
      library_list = library.scrape_libraries
      library_list.each do |other_lib|
        add_new_library(other_lib["url"])
      end
  end

end




