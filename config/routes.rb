AdventureLibrary::Application.routes.draw do
  
  resources :adventures do
    resources :pages
  end

  resources :libraries

end
