class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    @libary = Library.where(:url => nil)
    respond_to do |f|
      f.html
      f.json {render :json => {"libraries" => @library.as_json(except: :id, include: :url)}}
    end
  end


  def new 
   end
end
