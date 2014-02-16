class AdventuresController < ApplicationController

def index
  @adventures = Adventure.all
  local_adventures = Adventure.where(:library_id => nil)

  respond_to do |f|
    f.html
    f.json { render :json => {"adventures" => local_adventures.as_json(except: :id, include: :pages)} }

  end
end

def new
end

def create
end

end
