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

    temp_library = Library.new(params[:library].permit(:url))
    library = Library.find_or_create_by(url: temp_library.url  )

    ScrapingWorker.perform_async(library.id)

    redirect_to libraries_path

  end


end