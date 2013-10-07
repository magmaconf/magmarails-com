require 'bundler'

Bundler.require

require 'sinatra/i18n'

class Crowdsite < Sinatra::Base
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
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
    #expires 86400, :public, :must_revalidate
  end

  def set_locale
    I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]
    @locale = params[:locale] if params[:locale]
    I18n.locale = @locale
  end

  get '/?:locale?' do
    set_locale
    time = Time.now
    mon = ["jun", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]

    @day = time.day
    @month = mon[time.month - 1]
    @year = time.year

    haml :index
  end
end
