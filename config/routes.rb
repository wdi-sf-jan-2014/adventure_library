AdventureLibrary::Application.routes.draw do
  
  root to: "libraries#index"
  get "/libraries", to: "libraries#index"

  get "/adventures", to: "adventures#index"
  resources :adventures do
    resources :pages
  end
  
end
