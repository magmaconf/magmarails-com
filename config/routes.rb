MagmarailsCom::Application.routes.draw do
  get  '/gallery_photos', to: 'gallery#show'
  post '/send_email',     to: 'site#send_email'
  post '/newsletter',     to: 'newsletter_subscriptions#create'
  get  '/2014',           to: 'site#show', id: '2014/home'

  get '/*id',            to: 'site#show', format: false
  root to: 'site#show', id: 'home'
end

