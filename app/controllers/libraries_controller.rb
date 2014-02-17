class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json {render :json => {:libraries => @libraries.as_json}}
    end
  end

  def new
    @library = Library.new()
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
        adv_response = Typhoeus.get("#{l_url}/adventures.json")
        adv_result = JSON.parse(adv_response)
        binding.pry
      end
    end
    redirect_to libraries_path
  end


end
