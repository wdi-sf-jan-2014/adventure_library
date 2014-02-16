AdventureLibrary::Application.routes.draw do
  resources :libraries, only: [:index]

  resources :adventures do
    resources :pages
  end

  root to: "adventures#index"
end
