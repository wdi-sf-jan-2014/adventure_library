class PagesController < ApplicationController

  before_filter :get_parent

  def new
    @page = @parent.pages.build
  end

  def create
    new_page = @parent.pages.build(page_params)
      if new_page.save
        redirect_to new_adventure_page_path()
      else 
        render :new
      end
  end

  def update
  end

  def show
    @page = @parent.pages.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private 

  def page_params
    params.require(:page).permit(:name, :text)
  end
  def get_parent
    @parent = Adventure.find_by_id(params[:adventure_id]) if params[:adventure_id]
  end
end
