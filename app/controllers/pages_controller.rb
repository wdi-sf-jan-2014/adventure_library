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
        redirect_to new_adventure_page_path(adv.id)
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
      redirect_to edit_adventure_page_path(@adv.id, @page.id)
    end

  end

  def destroy
    adv = Adventure.find(params[:adventure_id])
    page = adv.pages.find(params[:id])
    
    page.name == "start" ? flash[:warning] = "Sorry, you can't delete the first page" : page.delete
    redirect_to adventure_pages_path(adv.id)

  end

  private

  def get_page_params
    params.require(:page).permit(:name, :text)

  end

end
