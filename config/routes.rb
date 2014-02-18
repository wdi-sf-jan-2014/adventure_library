AdventureLibrary::Application.routes.draw do
  get "/", to: "adventures#index"

  resources :adventures do
    resources :pages
  end
  
  resources :libraries

end
