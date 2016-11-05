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

  def schedule
    if params[:guide] && params[:date]
      startDate = DateTime.parse(params[:date])
      @schedules = BookingSchedule.includes(:booking).where(bookings: {guide_id: params[:guide]}).where("traveler_date >= ?",startDate.beginning_of_month)
        .where("traveler_date <= ?",startDate.end_of_month).pluck(:traveler_date)
      render json: @schedules, status: :ok
    else
      render json: "不正なアクセス！", status: :bad_request
    end
  end
end
