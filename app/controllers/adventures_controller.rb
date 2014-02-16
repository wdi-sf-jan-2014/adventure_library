class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
    respond_to do |f|
      f.html
      f.json { render :json => @adventures.as_json(include: :pages) }
    end
  end


  def new
    @adventure = Adventure.new
  end

  def create
    new_adv = params.require(:adventure).permit(:title, :author)
    new_guid = Adventure.gen_random_str

    adv =  new_adv.merge(guid: new_guid)
    an_adv = Adventure.create(adv)

    redirect_to adventure_path(an_adv.id)
  end

  def show
    @adventure = Adventure.find(params[:id])
    @start_page = @adventure.pages.find_by(name: "start")
  end

  def destroy
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
  end
end
