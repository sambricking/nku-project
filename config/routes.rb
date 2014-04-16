NkuProject::Application.routes.draw do

  resources :notes

  #root :to =>"notes#index"
  root "notes#index"
end
