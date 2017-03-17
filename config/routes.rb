Rails.application.routes.draw do
  resources :my_threads do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
