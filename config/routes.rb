Rails.application.routes.draw do
  resources :rooms, only: %i[show create], param: :title
  resources :messages, only: %i[create]
  root "rooms#index"
end
