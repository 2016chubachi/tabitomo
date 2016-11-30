class LicencePicturesController < ApplicationController
  def show
    @LicencePicture = LicencePicture.find(params[:id])
    send_data @LicencePicture.image, type: @LicencePicture.pictype, disposition: "inline"
  end
end
