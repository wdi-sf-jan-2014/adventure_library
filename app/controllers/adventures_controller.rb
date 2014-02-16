class AdventuresController < ApplicationController

  def index
    @library = Library.find_by_url("/adventures")
    respond_to do |f|
      f.html
      f.json {render json: Library.adventure_to_json(@library)}
    end
  end

  def show
  end

  def edit
  end

  def new
  end
end