class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(:library_id => nil)
    respond_to do |f|
      f.json { render :json => {"adventures" => @local_adventures.as_json(include: :pages)} }
      f.html 
    end
  end

  def create 
  end

end
