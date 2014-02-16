class LibrariesController < ApplicationController

  def index

    @all_libraries = Library.all

    respond_to do |f|
      f.html
      f.json {render :json => {libraries: @all_libraries}}
    end
  end


  def create
  end


1. get the new library in from your form
2. take the url from the from
3. get the typhoes response from the url
4. add /libraries then add /libarries
5. json parse to create the new objects
6. for each adventure create the posts
 

end
