AdventureLibrary::Application.routes.draw do
  root to: 'adventures#index'

  resources :libraries do
    resources :adventures
  end

  resources :adventures do
    resources :pages
  end

end
