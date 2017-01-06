class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  before_action :set_locale
  # メンバーの登録時に使用する。strong parameter に下記のパラメターを追加する。
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # 全リンクに locale 情報をセットする
  # @return [Hash] locale をキーとするハッシュ
  def default_url_options(options = {})
    #二つの書き方はどっちでもいい
    { locale: I18n.locale }.merge options
    #options.merge(locale: I18n.locale)
  end

  # リンクの多言語化に対応する
  def set_locale
    #セッションでの　locale を保つために変更
    # I18n.locale = params[:locale] || I18n.default_locale
    # ブラウザの設定言語を読込
    client_language = nil
    if request.env["HTTP_ACCEPT_LANGUAGE"].present? && request.env["HTTP_ACCEPT_LANGUAGE"].split(',').present? && match_result = request.env["HTTP_ACCEPT_LANGUAGE"].split(',')[0].match(/#{I18n.available_locales.map(&:to_s).join('|')}/)
      client_language = match_result[0]
    end
    I18n.locale = params[:locale] || session[:locale] || client_language || I18n.default_locale
    session[:locale] = I18n.locale
    # topページとnavバー検索フォームオブジェクト
    @top_search_guide = Search::Guide.new
  end

  def render_404(exception = nil)
    @exception = exception
    if request.xhr?
      render json: { error: '404 error' }, status: 404
    else
      format = params[:format] == :json ? :json : :html
      render template: 'errors/error_404', formats: format, status: 404, layout: 'application', content_type: 'text/html'
    end
  end

  def render_500(exception = nil)
    @exception = exception
    if request.xhr?
      render json: { error: '500 error' }, status: 500
    else
      format = params[:format] == :json ? :json : :html
      render template: 'errors/error_500', formats: format, status: 500, layout: 'application', content_type: 'text/html'
    end
  end

  # for session keeping
  # def default_url_options(options = {})
  #   { locale: I18n.locale }.merge options
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country_id, :hantei])
  end
end
