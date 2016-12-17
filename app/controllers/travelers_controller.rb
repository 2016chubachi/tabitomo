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
      flash[:success] = t('success')
      redirect_to edit_traveler_path @traveler
    else
      # エラー情報を遷移先に渡す
      session[:errors] = @traveler.errors.full_messages
      redirect_to edit_traveler_path @traveler
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

end
