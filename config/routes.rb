Rails.application.routes.draw do

  resources :lists  do
    resources :items, only: [:create, :destroy] do
      member do
        patch :complete
      end
    end
  end

  root 'lists#index'
end
