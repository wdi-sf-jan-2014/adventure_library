class AdventuresController < ApplicationController

def index
  @adventures = Adventure.all
  local_adventures = Adventure.where(:library_id => nil)

  respond_to do |f|
    f.html
    f.json { render :json => {"adventures" => local_adventures.as_json(except: :id, include: :pages)} }
    binding.pry
#    f.json {render json: local_adventures.to_json(only: [:title, :author, :timestamps, :guid], include: [{pages: }])}
#    f.json { render :json => local_adventures, include => :pages }
  end
end

def new
end

def create
end

end
