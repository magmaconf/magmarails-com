require 'bundler'

Bundler.require

require 'sinatra/i18n'
require 'sinatra/partial'

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
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first

    I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]
    locale = params[:locale] if params[:locale]
    I18n.locale = locale || browser_locale
  end

  get '/google06ae2c244c007126.html' do
    haml :google06ae2c244c007126, layout: false
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
end
