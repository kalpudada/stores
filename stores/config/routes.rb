Rails.application.routes.draw do
  # get 'welcome/index'

  resources :stores
  root 'stores#index'
  get 'stores/:id' => 'stores#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
