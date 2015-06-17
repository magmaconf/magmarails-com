class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_id

  def set_id
    @id = params[:id]
    @is_iphone = request.env['HTTP_USER_AGENT'].scan(/iPhone|iPad|iPod/).any?
  end
end
