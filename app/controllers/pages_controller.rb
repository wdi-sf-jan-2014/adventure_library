class PagesController < ApplicationController
  def index
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @page = Page.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
