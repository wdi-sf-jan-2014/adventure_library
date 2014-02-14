class AdventuresController < ApplicationController
  def new
    @adventure = Adventure.new
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author)
    new_adventure[:guid] = SecureRandom.urlsafe_base64(10)
    @adventure = Adventure.create(new_adventure)
  end
end
