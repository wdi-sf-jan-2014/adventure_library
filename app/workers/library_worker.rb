class LibraryWorker
  include Sidekiq::Worker

  def perform
    library_link = Typhoeus.get(params[:url]+"/libraries.json")
    result = JSON.parse(library_link.body)
    i = 0
    while i < result["libraries"].size
      new_library = Library.find_or_initialize_by(url: result["libraries"][i]["url"])
      new_library.save
      i +=1
    end

    adventure_link = Typhoeus.get(params[:url]+"/adventures.json")
    result = JSON.parse(link.body)
    i = 0
    while i < result["adventures"].size
      new_adventure = Adventure.find_or_initialize_by(title: result["adventures"][i]["title"])
      new_adventure.save
      new_adventure.update_attributes(author: result["adventures"][i]["author"],
                                      created_at: result["adventures"][i]["created_at"],
                                      updated_at: result["adventures"][i]["updated_at"],
                                      guid: result["adventures"][i]["guid"])
      i +=1
    end
  end

end
