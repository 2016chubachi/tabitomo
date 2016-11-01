class GuideDetailController < ApplicationController
  def show
    @guide = Guide.find(params[:id])
    @reviews = UserReview.includes(:booking).where(bookings: {guide_id: params[:id]})
  end
end
