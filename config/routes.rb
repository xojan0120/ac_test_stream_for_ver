Rails.application.routes.draw do
  root 'rooms#show'
  get 'rooms/show',  to: 'rooms#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
