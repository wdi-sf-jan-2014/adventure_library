AdventureLibrary::Application.routes.draw do
  resources :adventures do
    resources :pages
  end

  get '/libraries', to: 'libraries#index'

end
