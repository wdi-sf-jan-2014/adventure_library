class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    # @result = Library.where(:url => nil)
    respond_to do |f|
      f.html
      f.json {render :json => {"libraries" => @library.as_json(except: :id)}}
    end
  end


  def new 
    @library = Library.new
   end

   def create
   end
end
