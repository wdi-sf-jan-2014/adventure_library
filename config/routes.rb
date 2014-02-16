AdventureLibrary::Application.routes.draw do
  


  resources :libraries, only: [:index, :new, :create]
  resources :adventures do
    resources :pages, except: [:index, :edit, :update]
  end

  root to: "adventures#new"
  

end
