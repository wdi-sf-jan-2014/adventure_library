class PagesController < ApplicationController
  def show
  end

  def new
    id = params[:adventure_id]
    find_page = Adventure.find(id)
    @adventure = find_page
  end

  def create
  end
end
