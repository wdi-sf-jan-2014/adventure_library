class LibrariesController < ApplicationController
  
  def index
    @libraries = Library.all

    respond_to do |f|
      f.html
      f.json { render :json => @libraries, :status => 200 }
    end

  end

  def new
    @library = Library.new

    respond_to do |f|
      f.html
      f.json {  render :json => { :error => "This page contains no data."}, 
                :status => 404 }
    end

  end

  def create
    library = Library.new(get_lib_params)

    if library.save

      respond_to do |f| 
        f.html { redirect_to libraries_path, :status => 302 }
        f.json { render :json => library, :status => 200 }
      end
    
    else
      flash[:warning] = "Sorry, your URL didn't work. Try again."
      
      respond_to do |f|
        f.html {  render :new, :status => 200 }
        f.json {  render :json => {:error => "This page contains no data."}, 
                  :status => 404 }
      end
    end

  end

  private

  def get_lib_params
    params.require(:library).permit(:url)
  end

end
