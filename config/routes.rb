
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  get "flights", to: "flights#index"
  root to: "flights#index"

#  get "new_booking", to: "bookings#new"

  resources :bookings, only: [:new,  :index]


#  resources :bookings, only: [:new, :create, :show, :index] do
#    get 'search', on: :collection
#  end

end
