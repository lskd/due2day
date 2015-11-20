Rails.application.routes.draw do

  resources :due2day_lists  do
    resources :due2day_items
  end

  root 'due2day_lists#index'
end
