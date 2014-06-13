MagmarailsCom::Application.routes.draw do

  root to: 'site2014#show', id: '2014/home'
  get '/*id', to: 'site2014#show', as: :static, format: false, constraints: { id: /2014\/.+/ }
  post '/send_email', to: 'site2014#send_email'
end
