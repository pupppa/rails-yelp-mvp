Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [ :new, :create, :update, :destroy, :edit ]
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#          Prefix Verb   URI Pattern                     Controller#Action
#     restaurants GET    /restaurants(.:format)          restaurants#index
#                 POST   /restaurants(.:format)          restaurants#create
#  new_restaurant GET    /restaurants/new(.:format)      restaurants#new
# edit_restaurant GET    /restaurants/:id/edit(.:format) restaurants#edit
#      restaurant GET    /restaurants/:id(.:format)      restaurants#show
#                 PATCH  /restaurants/:id(.:format)      restaurants#update
#                 DELETE /restaurants/:id(.:format)      restaurants#destroy
