MagmarailsCom::Application.routes.draw do

  root to: 'high_voltage/pages#show', id: 'home'
  get '/*id', to: 'site2014#show', format: false, constraints: { id: /2014\/.+/ }
  get '/2014', to: 'site2014#show', id: '2014/home'
  post '/send_email', to: 'site2014#send_email'
  post '/newsletter', to: 'newsletter_subscriptions#create'
end
