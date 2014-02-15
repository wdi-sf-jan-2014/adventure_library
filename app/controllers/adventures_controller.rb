class AdventuresController < ApplicationController
  def new
    @adventure = Advenure.new
  end

  def create
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  def delete
  end

  def index
  end

end
