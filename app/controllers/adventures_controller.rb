class AdventuresController < ApplicationController


  def index
    @adventures = []
    @local_adventures = []
    @library = Library.new


    #making an array of all adventures
    Adventure.all.each do |adv|
      @adventures << adv
      if adv.library_id == nil
        @local_adventures << adv
      end
    end

    respond_to do |f|
      f.html
      f.json { render :json => {:adventures => @local_adventures.as_json(except: [:id, :library_id], include: {:pages => {except: :id} })} }
    end
  end

  def show
    adventure = Adventure.find(params[:id])

    #finds the adventures starting page
    start_page = adventure.pages.where(:name => "start")

    #redirects you to the starting page of the adventure
    redirect_to adventure_page_path(adventure, start_page.first.id)

  end

  def new
    @adventure = Adventure.new
  end

  def create
    adventure_params = params.require(:adventure).permit(:title, :author, pages_attributes: [:name, :text])
    adventure = Adventure.create(adventure_params)
    adventure.guid = SecureRandom.urlsafe_base64(10)
    adventure.save
    redirect_to adventure_path(adventure)
  end

  def edit
  end

  def update
  end


end
