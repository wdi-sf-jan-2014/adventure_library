class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    respond_to do |f|
      
    end
  end
  def create 
  end
end
