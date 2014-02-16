class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all

    # get adventures that were created from this site
    local_adventures = Adventure.where("library_id" => nil)
    respond_to do |format|
      format.html
      format.json {render :json => local_adventures.to_json(except: [:id, :library_id],
                                      include: {pages: {except: [:id, :adventure_id]}} )}
    end
  end

end
