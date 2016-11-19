class Search::Guide < Search::Base
  ATTRIBUTES = %i(
    city
    gender_man
    gender_woman
    license_has
    license_not
  )
  attr_accessor(*ATTRIBUTES)

  def selectBySearch
    guides = ::Guide.all
    # ライセンスのチェック状況によって、条件を付く
    if license_has == "1" && license_not == "0"
      # ライセンス有りだけがチェックされた場合
      guides = guides.where(license_flg: 1)
    elsif license_has == "0" && license_not == "1"
      # ライセンス無だけがチェックされた場合
      guides = guides.where(license_flg: 0)
    end
    if city.present?
      # GuideCityをjoinして検索する
      guides = guides.includes(:guide_cities).where(guide_cities: {city_master_id: city}) 
    end
    # 性別のチェック状況によって、条件を付く
    if gender_man == "1" && gender_woman == "0"
      # 男性だけがチェックされた場合
      guides = guides.includes(:member).where(members: {gender: 1}) 
    elsif gender_man == "0" && gender_woman == "1"
      # 女性だけがチェックされた場合
      guides = guides.includes(:member).where(members: {gender: 0}) 
    end
    guides
  end
  
  def selectByNavbar
    guides = ::Guide.all
    
    if city.present?
      # Guide => GuideCity => CityMasterの順でJOINする
      guides = guides.joins({guide_cities: :city_master}).where("city_masters.text_ja LIKE :city OR city_masters.text_en LIKE :city OR city_masters.text_zh LIKE :city OR city_masters.text_ko LIKE :city",city: "%#{city}%").uniq()
    end
    
    guides
  end

  def selectByIndex
    guides = ::Guide.all
    
    guides = guides.includes(:guide_cities).where(guide_cities: {city_master_id: city}) 
  end
end