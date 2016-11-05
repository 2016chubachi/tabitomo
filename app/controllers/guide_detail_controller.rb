class GuideDetailController < ApplicationController
  def show
    @guide = Guide.find(params[:id])
    @reviews = UserReview.includes(:booking).where(bookings: {guide_id: params[:id]})
    @revCount = @reviews.count
    @fiveCount = @reviews.where(star_master_id: 5).count
    @fourCount = @reviews.where(star_master_id: 4).count
    @threeCount = @reviews.where(star_master_id: 3).count
    @twoCount = @reviews.where(star_master_id: 2).count
    @oneCount = @reviews.where(star_master_id: 1).count
  end
end
