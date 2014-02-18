class PagesController < ApplicationController
  before_filter :get_parent

  def index
    redirect_to :controller => 'pages', :action => 'show', :id => @parent.pages.first
  end

  def new
    @page = @parent.pages.build
  end 

  def create
    @page = @parent.pages.build(params.require(:page).permit(:name, :text))
    if @page.save 
      redirect_to adventures_path(@page.adventure)
    else
      render :new
    end
  end

  def show
    @page = @parent.pages.find(params[:id])
  end

   protected 
   
  def get_parent
    @parent = Adventure.find_by_id(params[:adventure_id]) if params[:adventure_id]
     
    redirect_to root_path unless defined?(@parent)
  end
end
