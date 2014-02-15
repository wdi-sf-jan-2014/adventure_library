class PagesController < ApplicationController
  def index
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @page }
    end
  end

  def update
  end

  def create
  end

  def new
  end

  def destroy
  end

  def edit
  end
end
