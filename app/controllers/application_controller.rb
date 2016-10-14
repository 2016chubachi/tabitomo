class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale

  # 全リンクに locale 情報をセットする
  # @return [Hash] locale をキーとするハッシュ
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
  # リンクの多言語化に対応する
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
