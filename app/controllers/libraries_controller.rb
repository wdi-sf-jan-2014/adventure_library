class LibrariesController < ApplicationController

    def index
      @libraries = Library.all
      respond_to do |f| 
        f.json { render :json => { "libraries" => @libraries }}
    end 

    def new 
      @library = Library.new
    end 


end
