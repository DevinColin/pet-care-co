Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :testimonials, :walkers, :services, :contents

  root "static_pages#home"
  get '/testimonials',      to: 'testimonials#index'
  get '/about',             to: 'walkers#index'
  get '/services',          to: 'services#index'
  get '/contact',           to: 'static_pages#contact',     as: 'contact'
  get '/admin',             to: 'static_pages#admin',       as: 'admin'

  # This code is suggested by devise when generating user controllers:
    #   Rails.application.routes.draw do
    #   devise_for :users, controllers: {
    #     sessions: 'users/sessions'
    #   }
    # end

  # Engine for rich text editor
  mount Ckeditor::Engine => '/ckeditor'

end
