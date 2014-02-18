class AdventuresController < ApplicationController

  def index
    # get adventures that were collected from other libraries
    @collected_adventures = Adventure.where.not(library_id: nil)

    # get adventures that were created from this site
    @local_adventures = Adventure.where(library_id: nil)

    respond_to do |format|
      format.html
      format.json {render :json => {:adventures => @local_adventures.as_json(except: [:id, :library_id],
                                      include: {pages: {except: [:id, :adventure_id]}} )}}
    end
  end

end
