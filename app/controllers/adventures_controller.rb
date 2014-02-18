class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(library_id: nil)

    respond_to do |format|
      format.html
      format.json { render json: {adventures: @local_adventures.as_json( 
              except: [:id, :library_id],
              include: {:pages => {except: :id}})} }
    end
  end


  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


end

