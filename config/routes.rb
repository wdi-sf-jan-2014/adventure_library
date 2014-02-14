AdventureLibrary::Application.routes.draw do
    root to: "adventures#new"
    get "libraries/index", to: "libraries#index", as: "libraries"
    get "libraries/new", to: "libraries#new", as: "new_library"
    resources :adventures do
      resources :pages
    end
  end
