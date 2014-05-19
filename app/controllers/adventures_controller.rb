class AdventuresController < ApplicationController
  before_action :lookup, only: [:show]

  def index
    @adventures = Adventure.all
    respond_to do |format|
      format.html
      format.json { render :json => { adventures: @adventures.where(library_id: nil).as_json(except: [:id, :library_id], include: {:pages => { only: [:name, :text]} })}, status: :ok }
    end
  end

  def scrape_adventures(library_id)
    library = Library.find(library_id)["url"]
    response_html = Typhoeus.get(library + "adventures.json")
    response_json = JSON.parse(response_html.body)
    response_json["adventures"].each do |adventure|
      if Adventure.find_by(guid: adventure["guid"]) == nil
        Adventure.create!(guid: adventure["guid"], title: adventure["title"], author: adventure["author"])
        if adventure["pages"] != nil
          adventure["pages"].each do |page|
            Page.create!(name: page["name"], text: page["text"])
          end
        end
      end
    end
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def lookup
    @adventure = Adventure.find(params[:id])
  end

end
