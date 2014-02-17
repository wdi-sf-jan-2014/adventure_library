class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f| 
      f.html 
      f.json { render :json => { "libraries" => @libraries.as_json(root: true) }}
    end 
  end 

  def new 
    @library = Library.new
  end 


  
  def create
    new_library = library_params 
    new_url = new_library["url"]
    response = Typhoeus.get("#{new_url}/libraries.json")
    result = JSON.parse(response.body)
    Library.create(new_library)
    
    
    redirect_to libraries_path
  end 

  def destroy
    Library.find(params[:id]).delete
    redirect_to libraries_path
  end


private
  def library_params 
    params.require(:library).permit(:url)
  end 


end




# def perform(library_id)
#     @library = Library.find(library_id)
#     adv_response = Typhoeus.get("#{@library.url}/libraries.json")
#     if adv_response != []
#       adv_result = JSON.parse(adv_response.body)
      
#       adv_result["libraries"].each do |library|
#         if Library.where(url: library["url"]) == []
#           Library.create(url: library["url"])
#         end
#       end  
#     end 

#   end  







