MagmarailsCom::Application.routes.draw do
  get  '/gallery_photos', to: 'gallery#show'
  post '/send_email',     to: 'site#send_email'
  post '/newsletter',     to: 'newsletter_subscriptions#create'
  get '/:year/speakers',  to: 'site#speakers'
  get '/:year/*id',       to: 'site#show', format: false
  root to: 'site#show', id: 'home'
  get '/*id',             to: 'site#show'
end

