class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    @libraries.each do |library|
      AdventuresWorker.perform_async(library.id)

      ### from AdventuresWorker
    #   if library.url.start_with?("http://")
    #   url = library.url + "/adventures.json"
    # else
    #   url = "http://" + library.url + "/adventures.json"
    # end

    # response = Typhoeus.get(url)

    # result = JSON.parse(response.body)

    # result["adventures"].each do |adventure|
    #   if library.adventures.where(title: adventure["title"]) == []

    #   adv = library.adventures.create(title: adventure["title"], 
    #                   author: adventure["author"], guid: adventure["guid"])

    #   adventure["pages"].each do |page|
    #     adv.pages.create(name: page["name"], text: page["text"])
    #   end
    #   end
    # end
    ###
    end
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
    
  end

  def create
    library = params.require(:library)[:url]
    @library = Library.create(url: library)

      LibrariesWorker.perform_async(@library.id)
    # redirect_to adventures_path
    # else

    ### from LibrariesWorker
    #   if @library.url.start_with?("http://")
    #     url = @library.url + "/libraries.json"
    #   else
    #     url = "http://" + @library.url + "/libraries.json"
    #   end

    # response = Typhoeus.get(url)

    #   if response != []
    #   result = JSON.parse(response.body)
      
    #   result["libraries"].each do |library|
    #     if Library.where(url: library["url"]) == []
    #       Library.create(url: library["url"])
    #     end
    #   end  

    #   end
      ###

    redirect_to libraries_path

  end

  def destroy
    Library.find(params[:id]).delete
    redirect_to libraries_path
  end



  
end
