class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @libraries = Library.all

    # get adventures that were created from this site
    local_adventures = Adventure.where("library_id" => nil)
    respond_to do |format|
      format.html
      format.json {render :json => {:adventures => local_adventures.as_json(except: [:id, :library_id], include: {pages: {except: [:id, :adventure_id]}} )}}
    end
  end

end
