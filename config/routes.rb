AdventureLibrary::Application.routes.draw do

  resources :libraries, only: [:index, :new, :create]
  resources :adventures do
    resources :pages
  end
end
