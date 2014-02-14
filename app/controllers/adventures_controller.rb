class AdventuresController < ApplicationController
  
  def index
    @adventures = Adventure.find_by(library_id: nil)
  end

  def new
    @adventure = Adventure.new
  end

  def create
    adv = Adventure.new(get_adv_params)
    if adv.save
      redirect_to adventure_page_path(adv, adv.start)
    else
      flash[:warning] = "Sorry, your adventure wasn't formatted properly. Try again."
      render :new
    end
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:id])
    adventure.update_attributes(get_adv_params)
  end

  def destroy
    adventure = Adventure.find(params[:id])
    adventure.delete
    redirect_to: adventures_path
  end

  private

  def get_adv_params
    params.require(:adventure)
          .permit(:title, :author, pages_attributes: [:name, :text])  
  end

end
