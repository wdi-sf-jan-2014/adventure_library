AdventureLibrary::Application.routes.draw do
  root "library#index"
  resources :libraries, only: [:index, :new, :create]
  resources :adventures do
    resources :pages
  end
end
