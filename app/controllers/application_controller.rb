class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  LAN_NAMES =
      { ja: "日本語", en: "English", ko: "한국어",zh: "中文" }

  # 全リンクに locale 情報をセットする
  # @return [Hash] locale をキーとするハッシュ
  def default_url_options(options = {})
    #二つの書き方はどっちでもいい
    { locale: I18n.locale }.merge options
    #options.merge(locale: I18n.locale)
  end

  # リンクの多言語化に対応する
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @language_name = LAN_NAMES[I18n.locale]
    # topページとnavバー検索フォームオブジェクト
    @top_search_guide = Search::Guide.new
  end

 # メンバーの登録時に使用する。strong parameter に下記のパラメターを追加する。
before_filter :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country_id, :hantei])
  
 end
end
