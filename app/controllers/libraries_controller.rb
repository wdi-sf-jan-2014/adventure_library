class LibrariesController < ApplicationController

  def index

    @all_libraries = Library.all

    respond_to do |f|
      f.html
      f.json {render :json => {libraries: @all_libraries}}
    end
  end


  def create
    new_library = params.require(:library).permit(:url)
    url = new_library["url"]
    response = Typhoeus.get("#{url}/libraries.json")
    result = JSON.parse(response.body)
    result["libraries"].each do |f|
      l_url= f["url"]
      if Library.where(url: l_url).exists?
      else
       Library.create(url: l_url)
      end
    end
    redirect_to libraries_path
  end



    #   new_library = params.require(:library).permit(:url)
    #   url = new_library["url"]
    #   repsonse = Typhoeus.get("#{url}/libraries.json")
    #   result = JSON.parse(response.body)
    #   result["libraries"].each do |f|
    #     l_url= f["url"]
    #     if Library.where.not(:url => l_url)
    #       Library.create(url: l_url)
    #     end
    #   redirect_to libraries_path

    # end

  def new
    @library = Library.new()
  end



# 1. get the new library in from your form
# 2. take the url from the from
# 3. get the typhoes response from the url
# 4. add /libraries then add /libarries
# 5. json parse to create the new objects
# 6. for each adventure create the posts
 

end
