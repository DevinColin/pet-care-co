Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :testimonials, :walkers, :services

  root "static_pages#home"
  get '/testimonials',      to: 'testimonials#index'
  get '/about',             to: 'walkers#index'
  get '/services',          to: 'services#index'
  get '/contact',           to: 'static_pages#contact',     as: 'contact'

  # devise_for :users

end
