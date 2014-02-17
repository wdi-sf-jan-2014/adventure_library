class LibraryWorker
  require 'JSON'
  include Sidekiq::Worker

  def perform

    library_link = Typhoeus.get(Library.first.url+"libraries.json")
    @result = JSON.parse(library_link.body)
    i = 0
    while i < @result["libraries"].size
      new_library = Library.find_or_initialize_by(url: @result["libraries"][i]["url"])
      new_library.save
      if new_library.url ==  "/adventures"
        Library.find_by_url("/adventures").destroy
      end
      i +=1
    end

    @library = Library.all
    @library.each do |library|
      adventure_link = Typhoeus.get(library["url"]+"/adventures.json")
      @adventure_result = JSON.parse(adventure_link.body)
      i = 0
      while i < @adventure_result["adventures"].size
        @new_adventure = Adventure.find_or_initialize_by(title: @adventure_result["adventures"][i]["title"])
        @new_adventure.save

        @new_adventure.update_attributes(author: @adventure_result["adventures"][i]["author"],
                                         created_at: @adventure_result["adventures"][i]["created_at"],
                                         updated_at: @adventure_result["adventures"][i]["updated_at"],
                                         guid: @adventure_result["adventures"][i]["guid"],
                                         library_id: library.id)



        @adventure_result["adventures"][i]["pages"].each do |add_page|
          @new_adventure = Adventure.last
          new_pages = @new_adventure.pages.find_or_initialize_by(name: add_page["name"])
          new_pages.save
          new_pages.update_attributes(text: add_page["text"])
        end
        i = i+1
      end
    end
  end
end
