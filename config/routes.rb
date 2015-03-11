Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
  resources :park
  resources :dantai


  resources :tops do
    collection do
      resources :nextacts, only: [:index,:new,:show]
    end
  end



  resources :students do
    member do
      resources :schedules, only: [:create, :new, :index]
    end
  end


end

