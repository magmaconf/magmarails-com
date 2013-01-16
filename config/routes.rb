Magmateaser::Application.routes.draw do
  match '/:section' => 'home#index'
  root to: 'home#index'
end
