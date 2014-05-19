class AdventuresController < ApplicationController
  before_action :lookup, only: [:show]

  def index
    @adventures = Adventure.all
    respond_to do |format|
      format.html
      format.json { render :json => { adventures: @adventures.where(library_id: nil).as_json(except: [:id, :library_id], include: {:pages => { only: [:name, :text]} })}, status: :ok }
    end
  end

  def show

  end

  def new
    @adventure = Adventure.new
  end

  def create
    @adventure = Adventure.create adventure_params
    @page = Page.new
    @page.name = "start"
    redirect_to @adventure
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def lookup
    @adventure = Adventure.find(params[:id])
  end

end
