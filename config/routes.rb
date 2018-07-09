Rails.application.routes.draw do
  # Back admin routes start


  namespace :owner do
    # institution_owner root
    root to: 'dashboard#index'
    resources :students
  end

  namespace :admin do
    resources :users
    resources :institutions
    # Admin root
    root to: 'base#index'
  end

  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }


  # Application root
  root to: 'application#home'
  # Front routes end
end
