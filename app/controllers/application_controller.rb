class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def categories
    @categories ||= Category.all
    @categories
  end

  helper_method :categories
  hide_action :categories
end
