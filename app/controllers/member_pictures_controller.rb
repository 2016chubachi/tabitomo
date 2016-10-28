class MemberPicturesController < ApplicationController
  def show
    @MemberPicture = MemberPicture.find(params[:id])
    send_data @MemberPicture.image, type: @MemberPicture.pictype, disposition: "inline"
  end
end
