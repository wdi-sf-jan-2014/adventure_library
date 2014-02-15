class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    @result = Library.where(:url => nil)
    respond_to do |f|
      f.html
      f.json {render :json => {"libraries" => @result.as_json(except: :id, include: :url)}}
    end
  end


  def new 
    @library = Library.new
   end
end
