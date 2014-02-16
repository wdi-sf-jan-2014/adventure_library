AdventureLibrary::Application.routes.draw do
  
  get "libraries/new"
  get "libraries", to: "libraries#index"
  post "libraries", to: "libraries#create"
  resources :adventures do
    resources :pages
  end

  root "adventures#index"
  
end
