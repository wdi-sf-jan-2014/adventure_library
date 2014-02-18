
class LibrariesController < ApplicationController
  def index
    # retrieve a list of external libraries
    libraries = Library.all

    # add our local library to the list, since it's not in the database
    libraries.push(url: '/adventures')

    # build a JSON root of the libraries array
    lib_root = Hash['libraries', libraries.as_json()]

    # convert the hash into JSON form and return
    render :json => lib_root
  end

  def create
    host_url = params[:library][:url]
    ScrapeWorker.perform_async(host_url)

    redirect_to adventures_path
  end
end
