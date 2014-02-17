AdventureLibrary::Application.routes.draw do
  
  root to: '/adventures'

  resources :adventures do
    resources :pages
  end

  resources :libraries

end
