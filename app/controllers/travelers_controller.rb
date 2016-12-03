class TravelersController < ApplicationController

  def new
    @traveler = Traveler.new
    @traveler.member.build_member_picture
  end

  def update
    @traveler = Member.find(params[:id])
    @traveler.update_attributes(traveler_params)
    if @traveler.save
      flash[:success] = 'Succeed saving profile information.'
      redirect_to edit_traveler_path @traveler
    else
      render 'edit'
    end
  end

  def edit
    @member = Member.find(params[:id])
    @member.build_member_picture unless @member.member_picture
  end

  # def create
  #   @traveler = Traveler.new(traveler_params)
  #   @traveler.save
  #   redirect_to @traveler
  #
  # end

  private
    def traveler_params
      attrs_Member = [:gender, :first_name, :last_name, :telphone, :country_id]
      attrs_Member << { member_picture_attributes: [:id, :uploaded_image,:_destroy]}
      params.require(:member).permit(attrs_Member)

    end

end
