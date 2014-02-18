class AdventuresController < ApplicationController
  def index
    # root page with all the adventures
    @foreign_adventures = Adventure.where("library_id IS NOT NULL")
    @local_adventures = Adventure.where(:library_id => nil)
    respond_to do |f|
      f.html
      f.json { render :json => {"adventures" => @local_adventures.as_json(except: :id, include: {:pages => {except: :id} } ) } }
    end
  end

  def new
    # form to create a new adventure
    @adventure = Adventure.new
  end

  def create
    @adventure = Adventure.new(adv_params)
    if @adventure["guid"] == nil
      @adventure["guid"] = SecureRandom.urlsafe_base64(10)
    end
    if @adventure.save
      respond_to do |f|
        f.html {redirect_to new_adventure_page_path(@adventure)}
        f.json {render :json => @adventure }
      end
    else
      render :new
    end
  end

  def show
    # show/start your adventure, with link to page 1 "/adventures/:adventure_id/"
    @adventure = Adventure.find(params[:id])
    @first_page = @adventure.pages.find_by_name("start")
  end

  def destroy
    @adventure = Adventure.find(params[:id]).destroy
    redirect_to adventures_path
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    @adventure = Adventure.find(params[:id])
    @adventure.update_attributes(adv_params)
    redirect_to adventure_path
  end

private 
  def adv_params
    params.require(:adventure).permit(:title, :author, pages_attributes: [ :name, :text ])
  end

end
