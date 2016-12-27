class GuidesController < ApplicationController
  before_action :authenticate_member!
  before_action :access_check!,except: [:new]

  def update
    @guide = Guide.find(params[:id])
    @guide.assign_attributes(guide_params)
    arr_errors = []
    # ライセンスのが[yes]の場合、画像のアップロードが必須
    if @guide.license_flg == 1 && !@guide.licence_picture.present?
      arr_errors << t('.licence_error')
    end
    # ガイド言語の重複チェック
    langs = []
    # for index in 0..1 do
    @guide.guide_languages.each do |lan|
      if lan._destroy == false && langs.include?(lan.language_code_id)
        arr_errors << t('.language_error')
      else
        langs << (lan.language_code_id)
      end
    end
    # ガイドシティの重複チェック
    cities = []
    @guide.guide_cities.each do |c|
      if c._destroy == false && cities.include?(c.city_master_id)
        arr_errors << t('.city_error')
      else
        cities << (c.city_master_id)
      end
    end
    if @guide.valid? && !arr_errors.present?
      @guide.save
      flash[:success] = t('.success')
      redirect_to edit_guide_path @guide
    else
      # 画像アップロードエラー処理
      setImageError
      
      arr_errors.each do |value|
        @guide.errors[:base] << value  
      end
      # ダミーリダイレクトのpath設定
      @redirect_path = edit_guide_path(@guide)
      # editをレンダーする
      render 'edit'
    end
  end

  def edit
    @guide = Guide.find(params[:id])
    @guide.member.build_member_picture unless @guide.member.member_picture
    @guide.build_licence_picture unless @guide.licence_picture
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
    
    # 画像アップロードエラー処理
    def setImageError
      if @guide.errors[:"member.member_picture.member_image_size"].present?
        # 会員画像のサイズエラー
        @guide.errors.delete(:"member.member_picture.member_image_size")
        @guide.errors[:base] << t(".member_picture_size_error")
      end
      if @guide.errors[:"member.member_picture.member_image_type"].present?
        # 会員画像のタイプエラー
        @guide.errors.delete(:"member.member_picture.member_image_type")
        @guide.errors[:base] << t(".member_picture_type_error")
      end
      if @guide.errors[:"licence_picture.licence_image_size"].present?
        # ライセンス写真のサイズエラー
        @guide.errors.delete(:"licence_picture.licence_image_size")
        @guide.errors[:base] << t(".licence_picture_size_error")
      end
      if @guide.errors[:"licence_picture.licence_image_type"].present?
        # ライセンス写真のタイプエラー
        @guide.errors.delete(:"licence_picture.licence_image_type")
        @guide.errors[:base] << t(".licence_picture_type_error")
      end
    end
    
    def access_check!
      # 自分のデータしかアクセスできない
      if !params[:id].present? || current_member.guide.id.to_s != params[:id]
        raise t('access_error')
      end
    end
end
