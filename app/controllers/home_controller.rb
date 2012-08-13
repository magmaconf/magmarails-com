class HomeController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=3000'
  end
end
