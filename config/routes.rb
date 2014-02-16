AdventureLibrary::Application.routes.draw do
  resources :libraries

  resources :adventures do
    resources :pages
  end

  root to: "adventures#index"
end
