AdventureLibrary::Application.routes.draw do
  get "/libraries", to: "libraries#index", as: "libraries"
  resources :adventures do
    resources :pages
  end
  root to: "libraries#index"
end
