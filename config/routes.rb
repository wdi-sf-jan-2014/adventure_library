AdventureLibrary::Application.routes.draw do

  get "libraries/", to: "libraries#index"
  post "libraries/create", to: "libraries#create"

  resources :adventures do
    resources :pages
  end

  root 'adventures#index'

 
  
end
