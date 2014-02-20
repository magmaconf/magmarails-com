require 'bundler'

Bundler.require

require 'sinatra/i18n'
require 'sinatra/partial'
require 'mandrill'

class Crowdsite < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::AssetPipeline
  register Sinatra::I18n

  set :root, File.dirname(__FILE__)
  set :assets_precompile, %w(application.js application.css *.png *.jpg *.svg *.ico *.otf *.eot *ttf)

  configure do
    sprockets.append_path File.join(root, 'assets', 'stylesheets')
    sprockets.append_path File.join(root, 'assets', 'javascripts')
    sprockets.append_path File.join(root, 'assets', 'images')
    sprockets.append_path File.join(root, 'assets', 'fonts')
    sprockets.append_path File.join(root, 'vendor', 'javascripts')

    I18n.default_locale = :en
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end

  def set_locale
    browser_locale = "es"
    if request.env['HTTP_ACCEPT_LANGUAGE']
      browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]
    locale = params[:locale] if params[:locale]
    I18n.locale = locale || browser_locale
  end
  
  get '/what-is-magma' do
    haml :what_is_magma
  end
  
  get '/accommodations' do
    haml :accommodations
  end
  
  get '/speakers' do
    haml :speakers
  end
  
  get '/schedule' do
    haml :schedule
  end
  
  get '/sponsors' do
    haml :sponsors
  end

  get '/?:locale?' do
    set_locale
    time = Time.now
    mon = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]

    @day = time.day
    @month = mon[time.month - 1]
    @year = time.year

    haml :index
  end

  post '/send_email' do
    email_status = send_email(params)
    response.status = email_status[:sent] ? 200 : 500
  end
end

require_relative 'helpers/init'
