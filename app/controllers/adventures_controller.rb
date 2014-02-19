class AdventuresController < ApplicationController

  # def new
  #   @adventure = Adventure.new
  # end

  def index
    @adventures = Adventure.all
    @local_adventures = Adventure.where(library_id: nil)
    respond_to do |f|
      f.html
      f.json {render :json => {:adventures => @local_adventures.as_json(except: [:id, :library_id, :created_at], include: {:pages => {except: :id}})} }
    end
  end

  def show
    @adventure = Adventure.find(params[:id])
    @start = @adventure.pages.find_by(name: "start").id
  end

  # def create
  #   adventure = params.require(:adventure).permit(:title, :author, :page_attributes => [:name, :text])
  #   adv = Adventure.create(adventure)
  #   adv.update_attribute(guid: SecureRandom.urlsafe_base64(10).to_s)
  # end

end

