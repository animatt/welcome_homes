Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'user', to: 'user#index'

  get 'admin', to: 'admin#index'

  get 'login/new', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'login', to: 'login#destroy'

  get 'sign_up/new', to: 'sign_up#new'
  post 'sign_up', to: 'sign_up#create'

  get 'admin_login/new', to: 'admin_login#new'
  post 'admin_login', to: 'admin_login#create'
  delete 'admin_login', to: 'admin_login#destroy'

  get 'admin_su_login/new', to: 'admin_su_login#new'

  root "home#index"
end
