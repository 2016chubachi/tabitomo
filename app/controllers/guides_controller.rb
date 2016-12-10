class GuidesController < ApplicationController
  before_action :authenticate_member!
  # def show
  #   @guide = Guide.find(params[:id])
  #   if params[:format].in?(["jpg", "png", "gif"])
  #     send_image
  #     send_l_image
  #   else
  #     render "show"
  #   end
  # end

  def new
    @guide = Guide.new
    @guide.member.build_member_picture
  end

  def update
    @guide = Guide.find(params[:id])
    @guide.assign_attributes(guide_params)
    # ライセンスのが[yes]の場合、画像のアップロードが必須
    if @guide.license_flg == 1 && !@guide.licence_picture.present?
      @guide.errors[:base] << "ライセンスに[yes]がチェックされた場合、ライセンス写真が必須です！"
    end
    # ガイド言語の重複チェック
    langs = []
    # for index in 0..1 do
    @guide.guide_languages.each do |lan|
      if lan._destroy == false && langs.include?(lan.language_code_id)
        @guide.errors[:base] << "ガイド言語が重複しています！"
      else
        langs << (lan.language_code_id)
      end
    end
    # ガイドシティの重複チェック
    cities = []
    @guide.guide_cities.each do |c|
      if c._destroy == false && cities.include?(c.city_master_id)
        @guide.errors[:base] << "ガイド都市が重複しています！"
      else
        cities << (c.city_master_id)
      end
    end
    if @guide.errors.present?
      # エラー情報を遷移先に渡す
      session[:errors] = @guide.errors.full_messages
      # メッセージ送信ページに遷移
      redirect_to edit_guide_path @guide
    else
      if @guide.save
        flash[:success] = t('success')
        redirect_to edit_guide_path @guide
      else
        # エラー情報を遷移先に渡す
        session[:errors] = @guide.errors.full_messages
        # メッセージ送信ページに遷移
        redirect_to edit_guide_path @guide
      end
    end
  end

  def edit
    @guide = Guide.find(params[:id])
    @guide.member.build_member_picture unless @guide.member.member_picture
    @guide.build_licence_picture unless @guide.licence_picture
  end

  def create
    @guide = Guide.new(guide_params)

    @guide.save
    redirect_to @guide

  end

  private
    def guide_params
      attrs_Guide = [:profile, :guide_service, :guide_transportation, :guide_interest, :experience, :license_flg,:birth_year]
      attrs_Guide  << { licence_picture_attributes: [:id, :uploaded_l_image,:_destroy]}
      attrs_Member = [:gender, :first_name, :last_name,:telphone,:country_id]
      attrs_Member << { member_picture_attributes: [:id, :uploaded_image,:_destroy]}
      attrs_Guide  << { member_attributes: attrs_Member}
      attrs_Guide  << { guide_languages_attributes: [:id, :language_code_id,:language_skill_id,:_destroy]}
      attrs_Guide  << { guide_cities_attributes: [:id, :city_master_id,:_destroy]}
      params.require(:guide).permit(attrs_Guide)

    end

    # def send_image
    #   if @member.member_picture.present?
    #     send_data @member.member_picture.image,
    #       type: @member.member_picture.pictype, disposition: "inline"
    #   else
    #     raise NotFound
    #   end
    # end
    #
    # def send_l_image
    #   if @guide.licence_picture.present?
    #     send_data @guide.licence_picture.image,
    #       type: @guide.licence_picture.pictype, disposition: "inline"
    #   else
    #     raise NotFound
    #   end
    # end

end
