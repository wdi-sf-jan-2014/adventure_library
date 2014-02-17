class LibrariesController < ApplicationController
  
  def index
    @libs = Library.all

    respond_to do |f|
      f.html

      f.json { render :json => {:libraries => @libs}, :status => 200 }
    end

  end

  def new
    @library = Library.new

  end

  def create
    lib = Library.new(get_lib_params)

    if lib.save
      puts "Lib id: #{lib.id}"
      LinksWorker.perform_async(lib.id)
      redirect_to libraries_path
    else
      flash[:warning] = lib.errors.empty? ? 
        "Sorry, your URL didn't work. Try again." : 
        lib.errors.full_messages.to_sentence

      redirect_to new_library_path
    end

  end

  private

  def get_lib_params
    params.require(:library).permit(:url)

  end

end
