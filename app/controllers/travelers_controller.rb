class TravelersController < ApplicationController
  before_action :authenticate_member!

  def new
    @traveler = Traveler.new
    @traveler.member.build_member_picture
  end

  def update
    @traveler = Member.find(params[:id])
    @traveler.assign_attributes(traveler_params)
    if @traveler.save
      flash[:success] = t('.success')
      redirect_to edit_traveler_path @traveler
    else
      # 画像アップロードエラー処理
      setImageError
      @member = @traveler
      # ダミーリダイレクトのpath設定
      @redirect_path = edit_traveler_path(@traveler)
      # editをレンダーする
      render 'edit'
      
    end
  end

  def edit
    @member = Member.find(params[:id])
    @member.build_member_picture unless @member.member_picture
  end


  private
    def traveler_params
      attrs_Member = [:gender, :first_name, :last_name, :telphone, :country_id]
      attrs_Member << { member_picture_attributes: [:id, :uploaded_image,:_destroy]}
      params.require(:member).permit(attrs_Member)

    end
    
    # 画像アップロードエラー処理
    def setImageError
      if @traveler.errors[:"member_picture.member_image_size"].present?
        # 会員画像のサイズエラー
        @traveler.errors.delete(:"member_picture.member_image_size")
        @traveler.errors[:base] << t(".member_picture_size_error")
      end
      if @traveler.errors[:"member_picture.member_image_type"].present?
        # 会員画像のタイプエラー
        @traveler.errors.delete(:"member_picture.member_image_type")
        @traveler.errors[:base] << t(".member_picture_type_error")
      end
    end

end
