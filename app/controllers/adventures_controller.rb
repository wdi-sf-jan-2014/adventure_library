class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(library_id: nil)

    respond_to do |format|
      format.html
      format.json { render json: { adventures: @local_adventures.as_json(include: :pages) } }
    end
  end

end