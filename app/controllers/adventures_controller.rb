class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    respond_to do |format|
      format.html
      format.json {render :json => @adventures.to_json(except: [:id, :library_id],
                                      include: :pages)}
    end
  end

end
