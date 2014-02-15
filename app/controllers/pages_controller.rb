class PagesController < ApplicationController
  def index
  end

  def show
    @adventure = Adventure.find(params[:id])
    @page = Page.find(params[:id])
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
