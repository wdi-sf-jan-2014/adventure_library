AdventureLibrary::Application.routes.draw do
  
  resources :adventures do
    resources :pages
  end

  resources :pages do
    resources :pages
  end

  resources :libraries

  root to: "libraries#index"
end
