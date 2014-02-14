class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end

  def show
    @adventure = Adventure.find_by_id(params[:id])
  end

  def new
    @adventure = Adventure.new
  end

  def create


  end

  def destroy
  end

  def edit
    @adventure = Adventure.find_by_id(params[:id])
  end

  def update
  end
end
