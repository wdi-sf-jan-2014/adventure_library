class AdventuresController < ApplicationController
  before_action :lookup, only: [:show]
  def index
    @adventures = Adventure.all
    binding.pry
  end

  def show

  end

  def new
  end

  def create
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
