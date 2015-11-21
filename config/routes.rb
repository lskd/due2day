Rails.application.routes.draw do

  resources :due2day_lists  do
    resources :due2day_items do
      member do
        patch :complete
      end
    end
  end

  root 'due2day_lists#index'
end
