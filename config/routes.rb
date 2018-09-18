Rails.application.routes.draw do
  # Back admin routes start


  namespace :owner do
    root to: 'students#index'
    resources :students
    resources :asignatures
    resources :courses
    get '/pay_fee/:id/:fee_id', to: 'students#pay_fee', as: 'student_pay_fee'
  end

  namespace :admin do
    root to: 'dashboard#index'
    resources :users
    resources :institutions
    get '/edit_password/:id', to: 'users#edit_password', as: 'user_edit_password'
  end

  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }


  # Application root
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # Front routes end
end
