Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  # This line throws a redundancy error if you un-comment it and run rails routes in the terminal
  # Devise user routes are there without it
  # devise_for :users

  resources :walkers, :services, :testimonials, :contents

end
