class ApplicationController < ActionController::Base
  include PagesHelper
  
  protect_from_forgery with: :exception
end
