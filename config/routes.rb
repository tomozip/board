Rails.application.routes.draw do
  resources :my_threads do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
