class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end

  def new
  @adventure = Adventure.new()
  end

  def create
    
  end

  def show
  end

  def edit
  end

  def delete
  end

  def update
  end
end
