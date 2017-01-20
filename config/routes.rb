Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :testimonials, :walkers, :services, :contents

  root "static_pages#home"
  get '/testimonials',                to: 'testimonials#index'
  get '/about',                       to: 'walkers#index'
  get '/services',                    to: 'services#index'
  get '/contact',                     to: 'static_pages#contact',    as: 'contact'
  get '/admin',                       to: 'static_pages#admin',      as: 'admin'
  get '/walkers/deactivate/:id',      to: 'walkers#deactivate',      as: 'walker_deactivate'
  get '/walkers/activate/:id',        to: 'walkers#activate',        as: 'walker_activate'
  get '/testimonials/invisible/:id',  to: 'testimonials#invisible',  as: 'testim_invisible'
  get '/testimonials/visible/:id',    to: 'testimonials#visible',    as: 'testim_visible'
  get '/contents/invisible/:id',      to: 'contents#invisible',      as: 'content_invisible'
  get '/contents/visible/:id',        to: 'contents#visible',        as: 'content_visible'

  post '/contact_email',            to: 'static_pages#contact_email'
  # This code is suggested by devise when generating user controllers:
    #   Rails.application.routes.draw do
    #   devise_for :users, controllers: {
    #     sessions: 'users/sessions'
    #   }
    # end

  # Engine for rich text editor
  mount Ckeditor::Engine => '/ckeditor'

end
