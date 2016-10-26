class StarMastersController < ApplicationController
  def show
    @StarMaster = StarMaster.find(params[:id])
    send_data @StarMaster.image, type: @StarMaster.pictype, disposition: "inline"
  end
end
