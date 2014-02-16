class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    respond_to do |format|
      format.html
      format.json {render :json => @adventures.as_json(except: [:id])}
    end
  end

end
