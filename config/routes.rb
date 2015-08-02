Rails.application.routes.draw do
  root 'maps#index'
  resources :maps, except: [:new, :edit]
  resources :logistic_meshes
  wash_out :best_way
end
