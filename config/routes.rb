AdventureLibrary::Application.routes.draw do
  
  root to: 'adventures#index'

  resources :adventures do
    resources :pages
  end

  resources :libraries

end
