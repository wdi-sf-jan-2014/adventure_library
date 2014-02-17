AdventureLibrary::Application.routes.draw do



  resources :adventures do
    resources :pages
  end

  root 'adventures#index'
  resources :libraries

 
  
end
