AdventureLibrary::Application.routes.draw do
  
  root to: "adventures#index"

  resources :libraries, only: [:index, :new, :create]
  resources :adventures do
    resources :pages, except: [:index, :edit, :update]
  end

  

end
