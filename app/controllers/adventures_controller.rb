class AdventuresController < ApplicationController

  def index 
    @local_adventures = Adventure.all
    @local_adventure = Adventure.where(:library_id => nil)
    @foreign_adventure = Adventure.where.not(:library_id => nil)
    respond_to do |f|
      f.html
      f.json { render :json  => { :adventures => @local_adventure.as_json(root: true, 
              include: { pages: { except: [:id, :created_at, :updated_at] } },
              except: [:id, :created_at, :updated_at]) } }
    end 
  end 

  def new 
    @local_adventure = Adventure.new    
    # @pages = @local_adventure.pages
  end 



  def create 
    new_adventure = params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])
    new_adventure["guid"] = SecureRandom.urlsafe_base64(10)
    @local_adventure = Adventure.create(new_adventure)
    redirect_to new_adventure_page_path(@local_adventure)
  end 

  def show 
    
    @local_adventure = Adventure.find(params[:id])
  end 

end


 
    
