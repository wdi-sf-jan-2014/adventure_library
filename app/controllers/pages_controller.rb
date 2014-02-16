class PagesController < ApplicationController

    def show

      # initialize page to nil, then search for requested page
      @page = nil

      # if requested page not found, will display error message
      # begin
        @adventure = Adventure.find(params[:adventure_id])
        @page = @adventure.pages.find(params[:id])
      # rescue ActiveRecord::RecordNotFoud
      #   flash[:error] = "That Adventure / Page not found."
      # end
    end

end
