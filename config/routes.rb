NkuProject::Application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  get "users/new"
  resources :notes
  resources :users
  root :to =>"users#new"
  #root "notes#index"
end
