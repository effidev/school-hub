require 'yaml'
PARAMETERS = YAML.load(File.read(File.expand_path('../../../config/parameters.yml', __FILE__)))

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    #logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    # logger.debug "* Locale set to '#{I18n.locale}'"
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def extract_locale_from_accept_language_header
    begin
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    rescue
      'en'
    end
  end
end
