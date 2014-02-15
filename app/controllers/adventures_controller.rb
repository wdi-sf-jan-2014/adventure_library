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
    # @page = @adventure.pages.create
  end

  def create
    adventure = params.require(:adventure).permit(:title, :author, :page_attributes => [:name, :text])
    adv = Adventure.create(adventure)
    adv.update_attribute(guid: SecureRandom.urlsafe_base64(10).to_s)
  end

end
