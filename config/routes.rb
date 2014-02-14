AdventureLibrary::Application.routes.draw do
  root "libraries#index"

  resources :adventures do
    resources :pages
  end
  resources :libraries
end
