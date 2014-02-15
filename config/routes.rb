AdventureLibrary::Application.routes.draw do
  root "libraries#index"
  resources :libraries, only: [:index, :new, :create]
  resources :adventures do
    resources :pages
  end
end
