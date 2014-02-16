class AdventuresController < ApplicationController
  def index
    @library = Library.find_by_url("/adventures")

    respond_to do |f|
      f.html
      f.json {render json: @library.to_json( include: [ adventures: { include: [ :pages ] } ] )   }
    end
  end

  def show
  end

  def edit
  end

  def new
  end
end