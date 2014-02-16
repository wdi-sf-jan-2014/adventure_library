class AdventuresController < ApplicationController
  def new
    @adventure = Adventure.new
    respond_to do |f|
      f.html { redirect_to site_path(@site) }
      f.json { render :json => {:error => "New path for site not found. Try create."}, :status => 404}
    end
  end

  def create #new adventure from others
    @adventure = params.require(:adventure) 

    # url = params.require(:site)[:url]
    # @site = Site.create(url: url)
    # LinksWorker.perform_async(@site.id)
    # respond_to do |f|
    #   f.html { redirect_to site_path(@site) }
    #   f.json { render :json => @site }
    # end
  end

  def show
    @adventure = Adventure.find(params[:id])


    # @adventure = @adventure.all
    # respond_to do |f|
    #   f.html
    #   f.json { render :json => @link.as_json(include: :pages)}
    # end

  end

  def delete
  end

  def index
    @all_adventures = Adventure.all
    @adventures = Adventure.where(library_id: nil)
    respond_to do |f|
      f.html
      f.json { render :json => {adventures: @adventures.as_json(include: :pages)}}
    end
  end

end
