Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :authors
get 'authors/:id/edit', to: 'authors#edit'

resources :posts
get 'posts/:id/edit', to: 'posts#edit'
end
