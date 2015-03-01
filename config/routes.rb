Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
  resources :students
  resources :park
  resources :dantai
  resources :tops
  get "", to: "top#index", as: "user_root"



  resources :students do
    member do
      resources :schedules, only: [:create, :new, :index]
    end
  end


end

