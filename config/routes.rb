AdventureLibrary::Application.routes.draw do
  # get "/libraries", to: "libraries#index", as: "libraries"
  # get "/libraries/new", to: "libraries#new", as: "new_library"
  resources :libraries
  resources :adventures do
    resources :pages
  end
  root to: "libraries#index"
end
