AdventureLibrary::Application.routes.draw do

  #root 'libraries#index'
  resources :adventures do
    resources :pages
  end

  get '/libraries(.:format)', to: "libraries#index"

end
