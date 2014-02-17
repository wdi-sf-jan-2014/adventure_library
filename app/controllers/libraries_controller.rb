class LibrariesController < ApplicationController

  def index

    @libraries = Library.all

    respond_to do |f|
      f.html
      f.json { render :json => {:libraries => @libraries.as_json(except: [:id, :created_at, :updated_at]) } }
    end

  end

  def new
    @library = Library.new

  end

  def create

    library = Library.new(params[:library].permit(:url))
    searched_lib = Library.where(:url => library.url).first

    #check if the library already exists
    if Library.all.include?(searched_lib)
      @library = library
    else
      @library = Library.create(params[:library].permit(:url))
    end

    ScrapingWorker.perform_async(@library.id)

    redirect_to libraries_path

  end


end