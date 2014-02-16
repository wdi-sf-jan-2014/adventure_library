class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
  end

  def new
    @adventure = Adventure.new
    guid = SecureRandom.urlsafe_base64(10)
  end

  def show
    adv_id = params[:id]
    @adventure = Adventure.find(adv_id)
    pages = @adventure.pages
    @start = pages.find_by name: "start"
  end

  def create
    adventure = Adventure.create
    redirect_to adventure
  end






end
