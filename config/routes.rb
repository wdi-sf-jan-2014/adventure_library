AdventureLibrary::Application.routes.draw do
  resources :libraries, only: [:index, :new]
  resources :adventures do
    resources :pages
  end
end
