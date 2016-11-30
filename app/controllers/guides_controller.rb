class GuidesController < ApplicationController

  def show
    @guide = Guide.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
      send_l_image
    else
      render "show"
    end

  end

  def new
    @guide = Guide.new
    @guide.member.build_member_picture
  end

  def update
    @guide = Guide.find(params[:id])
    @guide.update_attributes(guide_params)
    if @guide.save
      flash.now[:success] = 'Succeed saving profile information.'
      redirect_to edit_guide_path @guide
    else
      render 'edit'
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
      # binding.pry
      params.require(:guide).permit(attrs_Guide)

    end

    def send_image
      if @member.member_picture.present?
        send_data @member.member_picture.image,
          type: @member.member_picture.pictype, disposition: "inline"
      else
        raise NotFound
      end
    end

    def send_l_image
      if @guide.licence_picture.present?
        send_data @guide.licence_picture.image,
          type: @guide.licence_picture.pictype, disposition: "inline"
      else
        raise NotFound
      end
    end

end
