Magmateaser::Application.routes.draw do
  resources :contacts, only: ['create']
  match '/:section' => 'home#index'
  root to: 'home#index'
end
