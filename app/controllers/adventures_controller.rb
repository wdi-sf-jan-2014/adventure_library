class AdventuresController < ApplicationController

  def index
    @all_adventures = Adventure.all
    @adventures = Adventure.where(library_id: nil)
    respond_to do |f|
      f.html
      # f.json {render :json => {adventures: @adventures, :include => :pages}}
      f.json {render :json => {adventures: @adventures.as_json(:include => :pages)}}
    end
  end

  def new
    @adventure = Adventure.new
    respond_to do |f|
      f.html
      f.json {render :json => {:error => "No stories 'ere, lad"}, :status => 404}
    end
    binding.pry
  end

  def create

  end

  def show
  end

end