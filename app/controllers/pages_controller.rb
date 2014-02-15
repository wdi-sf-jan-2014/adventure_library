class PagesController < ApplicationController

  def show

  end

  def create
    adventure_id =params[:adventure_id]
    @adventure = Adventure.find(adventure_id)
    page = params[:page].require(:name, :text)
    page = Page.create(page)
    @page = linkify_page(page)
    redirect_to adventure_page
    respond_to do |format|
    format.html
    format.json {render json: @adventure}
  end
  end

  def edit
  end

  def index
    adventure_id =params[:adventure_id]
    @adventure = Adventure.find(adventure_id)
    respond_to do |format|
      format.html
      format.json {render json: @adventure}  
      
    end
  end

  def show
    adventure_id = params[:adventure_id]
    id = params[:id]
    @adventure = Adventure.find(adventure_id)
    @page = Page.find(id)
    respond_to do |format|
        format.html
        format.json {render json: @adventure}
      end

  end

  def update
  end
end
