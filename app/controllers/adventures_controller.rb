class AdventuresController < ApplicationController
  def index
    # root page with all the adventures
  end

  def new
    # form to create a new adventure
    @adventure = Adventure.new
  end

  def create
    # raise params.inspect
    adventure = Adventure.new(params.require(:adventure).permit(:title, :author, pages_attributes: [ :name, :text ]))
    if adventure.save
      redirect_to new_adventure_page_path(adventure.id)
    else
      render :new
    end
  end

  def show
    # show/start your adventure, with link to page 1 "/adventures/:adventure_id/"
    @adventure = Adventure.find(params[:id])
  end

  def delete
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end
end
