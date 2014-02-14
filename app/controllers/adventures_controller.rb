class AdventuresController < ApplicationController
  
  def index
    @adventures = Adventure.where(library_id: nil)

    respond_to do |f|
      f.html 
      f.json { render :json => @adventures, :status => 200 }
    end
  end

  def new
    @adventure = Adventure.new

    respond_to do |f|
      f.html 
      f.json {  render :json => { :error => "This page contains no data." }, 
                :status => 404 }
    end
  end

  def create
    adv_params = get_adv_params
    adv_params[:guid] = SecureRandom.urlsafe_base64(10)
    adv = Adventure.new(adv_params)

    if adv.save

      respond_to do |f|
        f.html { redirect_to adventure_page_path(adv.id, adv.start.id), 
                :status => 302 }
        f.json { render :json => adv, :status => 201 }
      end

    else
      flash[:warning] = "Sorry, your adventure wasn't formatted properly. Try again."

      respond_to do |f|
        f.html {  render :new, :status => 200 }
        f.json {  render :json => { :error => "This page contains no data" }, 
                  :status => 404 }
      end
    end
  end

  def show
    @adventure = Adventure.find(params[:id])

    respond_to do |f|
        f.html { redirect_to adventure_page_path(@adventure.id, @adventure.start.id), :status => 302 }
        f.json { render :json => @adventure, :status => 200 }
    end
  end

  def edit
    @adventure = Adventure.find(params[:id])

    respond_to do |f|
      f.html 
      f.json { render :json => {:error => "This page contains no data"}, 
               :status => 404 }
    end
  end

  def update
    adventure = Adventure.find(params[:id])
    adventure.update_attributes(get_adv_params)
    
    respond_to do |f|
      f.html { redirect_to adventures_path, :status => 302 }
      f.json { render :json => adventure, :status => 200 }
    end
  end

  def destroy
    adventure = Adventure.find(params[:id])
    adventure.delete

    respond_to do |f|
      f.html { redirect_to adventures_path, :status => 302 }
      f.json { render :json => adventure, :status => 200 }
    end
  end

  private

  def get_adv_params
    params.require(:adventure)
          .permit(:title, :author, pages_attributes: [ :name, :text ])  
  end

end
