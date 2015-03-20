MagmarailsCom::Application.routes.draw do
  get '/*id', to: 'site#show', format: false, constraints: { id: /201(4|5)\/.+/ }
  get '/2014', to: 'site#show', id: '2014/home'

  get '/gallery_photos', to: 'gallery#show'
  post '/send_email', to: 'site#send_email'
  post '/newsletter', to: 'newsletter_subscriptions#create'

  root to: 'site#show', id: 'home'
end
