class ScrapingWorker
  include Sidekiq::Worker

  def perform(library_id)

    #find the library
    library = Library.find(library_id)

    response = Typhoeus.get("#{library.url}" + "/adventures.json")
    result = JSON.parse(response.body)

    #grab the library's adventures and pages and add it to your own
    result['adventures'].each do |adv| 
      # only create adventures that don't already exist in your library
      unless Adventure.all.include?(adv)
        new_adv = Adventure.create(title: adv['title'], author: adv['author'], created_at: adv['created_at'], updated_at: adv['updated_at'], guid: adv['guid'])
        adv['pages'].each do |page|
          new_page = Page.create(name: page['name'], text: page['text'])
          new_adv.pages << new_page
        end
        library.adventures << new_adv
      end
    end

    #grab the Library's url and add it to my own
    unless Library.all.include?(library)
      new_lib = Library.create(url: library.url)
      Library.all << new_lib
    end

    #find the library's libraries
    response = Typhoeus.get("#{library.url}" + "/libraries.json")
    result = JSON.parse(response.body)

    result['libraries'].each do |lib| 
      # only create libraries that don't already exist in my library.
      unless Library.all.include?(lib)
        new_lib = Library.create(url: lib.url)
        Library.all << new_lib
      end
  end

end