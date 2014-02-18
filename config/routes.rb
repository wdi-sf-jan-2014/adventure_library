AdventureLibrary::Application.routes.draw do
  resources :adventures do
    resources :pages
  end

  # set the root route to hit the adventures index
  root to: 'adventures#index'

  # add the route to provide list of libraries
  get '/libraries', to: 'libraries#index'

  # add a route create a new library (to scrape)
  get '/libraries/new', to: 'libraries#new'

  # add a route to save newly created library
  post '/libraries', to: 'libraries#create'

  # add a route to show a specific library
  get '/libraries/:id', to: 'libraries#show', as: 'library'
  
#              Prefix Verb   URI Pattern                                        Controller#Action
#     adventure_pages GET    /adventures/:adventure_id/pages(.:format)          pages#index
#                     POST   /adventures/:adventure_id/pages(.:format)          pages#create
#  new_adventure_page GET    /adventures/:adventure_id/pages/new(.:format)      pages#new
# edit_adventure_page GET    /adventures/:adventure_id/pages/:id/edit(.:format) pages#edit
#      adventure_page GET    /adventures/:adventure_id/pages/:id(.:format)      pages#show
#                     PATCH  /adventures/:adventure_id/pages/:id(.:format)      pages#update
#                     PUT    /adventures/:adventure_id/pages/:id(.:format)      pages#update
#                     DELETE /adventures/:adventure_id/pages/:id(.:format)      pages#destroy
#          adventures GET    /adventures(.:format)                              adventures#index
#                     POST   /adventures(.:format)                              adventures#create
#       new_adventure GET    /adventures/new(.:format)                          adventures#new
#      edit_adventure GET    /adventures/:id/edit(.:format)                     adventures#edit
#           adventure GET    /adventures/:id(.:format)                          adventures#show
#                     PATCH  /adventures/:id(.:format)                          adventures#update
#                     PUT    /adventures/:id(.:format)                          adventures#update
#                     DELETE /adventures/:id(.:format)                          adventures#destroy

end
