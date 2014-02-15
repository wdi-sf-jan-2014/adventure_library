class LibrariesController < ApplicationController
  
  def index
    @libs = Library.all

    respond_to do |f|
      f.html

      f.json { render :json => @libs, :status => 200 }
    end

  end

  def new
    @library = Library.new

  end

  def create
    library = Library.new(get_lib_params)

    if library.save
      LinksWorker.perform_async(library.id)
      redirect_to libraries_path
    else
      flash[:warning] = library.errors.empty? ? 
        "Sorry, your URL didn't work. Try again." : 
        library.errors.full_messages.to_sentence

      render :new
    end

  end

  private

  def get_lib_params
    params.require(:library).permit(:url)

  end

end
