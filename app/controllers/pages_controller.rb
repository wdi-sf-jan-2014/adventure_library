class PagesController < ApplicationController
  helper PagesHelper

  def index
    adv = Adventure.find(params[:adventure_id])
    start_page = adv.pages.where(:name => "start").first

#    adv_pages = Page.find_by(adventure_id: adv_id, name: "start")
    redirect_to adventure_page_path(adv.id, start_page.id)
  end

  def show
    adv = Adventure.find(params[:adventure_id])
    @page = adv.pages.where(:id => params[:id]).first

  end

end




