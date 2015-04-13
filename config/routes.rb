Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :park
  resources :dantai
  # ログイントークン
  get 'token/:uuid', :to => 'users#token'
  resources :members
  devise_scope :user do
    get 'users/complete' => 'devise/registrations#complete'
  end

  resources :tops do
    collection do
      resources :nextacts, only: [:index,:new,:show,:create]
    end
  end



  resources :students do
    member do
      resources :schedules, only: [:create, :new, :index]
    end
  end


end

