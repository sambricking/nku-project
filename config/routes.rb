NkuProject::Application.routes.draw do

  get "users/new"
  resources :notes

  #root :to =>"notes#index"
  root "notes#index"
end
