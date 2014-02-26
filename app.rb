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
    
    sprockets.css_compressor = YUI::CssCompressor.new
    sprockets.js_compressor = YUI::JavaScriptCompressor.new

    I18n.default_locale = :en
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
    
    Sprockets::Helpers.configure do |config|
      config.asset_host = "assets%d.magmaconf.com.global.prod.fastly.net"
    end
  end

  def set_locale
    browser_locale = "es"
    if request.env['HTTP_ACCEPT_LANGUAGE']
      browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]
    locale = params[:locale] if params[:locale]
    I18n.locale = locale || browser_locale

    @date = Time.now.strftime "%b|%d|%Y"
  end

  get '/about-magma' do
    set_locale
    haml :about_magma
  end

  get '/accommodations' do
    set_locale
    haml :accommodations
  end

  get '/speakers' do
    set_locale
    haml :speakers
  end

  get '/schedule' do
    set_locale
    haml :schedule
  end

  get '/sponsors' do
    set_locale
    haml :sponsors
  end

  get '/?:locale?' do
    set_locale
    haml :index
  end

  post '/send_email' do
    email_status = send_email(params)
    response.status = email_status[:sent] ? 200 : 500
  end
end

require_relative 'helpers/init'
