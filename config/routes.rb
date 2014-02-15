AdventureLibrary::Application.routes.draw do
  get "pages/index"
  get "pages/create"
  get "pages/new"
  get "pages/edit"
  get "pages/show"
  get "pages/update"
  get "pages/destroy"
  resources :adventures do
    resources :pages
  end  
end

#         pages_index GET    /pages/index(.:format)                             pages#index
#        pages_create GET    /pages/create(.:format)                            pages#create
#           pages_new GET    /pages/new(.:format)                               pages#new
#          pages_edit GET    /pages/edit(.:format)                              pages#edit
#          pages_show GET    /pages/show(.:format)                              pages#show
#        pages_update GET    /pages/update(.:format)                            pages#update
#       pages_destroy GET    /pages/destroy(.:format)                           pages#destroy
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
