class PagesController < ApplicationController
  
  def index
    @adv = Adventure.find(params[:adventure_id])
    @pages = @adv.pages
    @start = @adv.start

  end

  def new
    @adv = Adventure.find(params[:adventure_id])
    @page = @adv.pages.build

  end

  def create
    adv = Adventure.find(params[:adventure_id])
    page = adv.pages.new(get_page_params)

    if page.save
      redirect_to adventure_page_path(adv.id, page.id)
    else
        flash[:warning] = "Sorry, your page had errors in it. Try again."
        render :new
    end

  end

  def show
    @adv = Adventure.find(params[:adventure_id])
    @page = @adv.pages.find(params[:id])

  end

  def edit
    @adv = Adventure.find(params[:adventure_id])
    @page = @adv.pages.find(params[:id])

  end

  def update
    @adv = Adventure.find(params[:adventure_id])
    @page = @adv.pages.find(params[:id])

    if @page.update_attributes(get_page_params)
      redirect_to adventure_page_path(@adv.id, @page.id)
    else
      flash[:warning] = flash[:warning] = "Sorry, your adventure wasn't formatted properly. Try again."
      render :edit
    end

  end

  def destroy
    adv = Adventure.find(params[:adventure_id])
    page = adv.pages.find(params[:id])
    
    page.name == "start" ? flash[:warning] = "Sorry, you can't delete the first page" : page.delete
    binding.pry
    redirect_to adventure_page_path(adv.id, adv.start.id)

  end

  private

  def get_page_params
    params.require(:page).permit(:name, :text)

  end

end
