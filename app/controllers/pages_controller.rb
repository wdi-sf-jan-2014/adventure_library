class PagesController < ApplicationController



  def new 
    5.times do
      Page.new
    end
    adventure_id= params[:adventure_id]
    redirect_to adventure_path(adventure_id)
    end

  

  def create
    adventure_id =params[:adventure_id]
    @adventure = Adventure.find(adventure_id)
    page = params[:page].require(:name, :text,:guid)
    page = Page.create(page)
    @page = linkify_page(page)
    redirect_to adventure_page
    respond_to do |format|
      format.html
      format.json {render json: @adventure}
    end
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

  
end
