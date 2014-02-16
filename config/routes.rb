AdventureLibrary::Application.routes.draw do

  root to: 'libraries#homepage'
  get "/libraries", to: "libraries#index"
  post "/libraries", to: "libraries#create"
  

  resources :adventures do
    resources :pages
  end
  
end
