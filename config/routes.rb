NkuProject::Application.routes.draw do
  
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "users/new"
  resources :share_user_notes
  resources :sessions
  resources :users do 
    resources :notes
  end
  
  resources :notes
  root :to =>"users#new"
  #root "notes#index"
end
