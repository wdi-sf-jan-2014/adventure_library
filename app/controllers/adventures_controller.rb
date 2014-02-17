class AdventuresController < ApplicationController
  
  def index
    @adventures = Adventure.where(library_id: nil)

    respond_to do |f|
      f.html 
      f.json { render :json => { :adventures => @adventures.as_json(:include => :pages) }, :status => 200 }
    end

  end

  def new
    @adventure = Adventure.new
  end

  def create
    adv_params = get_adv_params
    adv_params[:guid] = SecureRandom.urlsafe_base64(10)
    adv = Adventure.new(adv_params)

    if adv.save
      redirect_to adventure_page_path(adv.id, adv.start.id)

    else
      flash[:warning] = "Sorry, your adventure wasn't formatted properly. Try again."
      render :new
    end

  end

  def show
    @adventure = Adventure.find(params[:id])
    redirect_to adventure_page_path(@adventure.id, @adventure.start.id)

  end

  def edit
    @adventure = Adventure.find(params[:id])

  end

  def update
    adventure = Adventure.find(params[:id])

    #if adventure.update_attributes(get_adv_params)
      redirect_to adventures_path
    # else
    #   flash[:warning] = flash[:warning] = "Sorry, your adventure wasn't formatted properly. Try again."
    #   redirect_to edit_adventure_path(adventure.id)
    # end

  end

  def destroy
    adventure = Adventure.find(params[:id])
    adventure.delete

    redirect_to adventures_path
  end

  private

  def get_adv_params
    params.require(:adventure)
          .permit(:title, :author, pages_attributes: [ :name, :text ])  
  
  end

end
