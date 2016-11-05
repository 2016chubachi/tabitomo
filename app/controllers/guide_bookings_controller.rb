class GuideBookingsController < ApplicationController
  before_action :authenticate_member!

  def index
    # 更新が新しい順で表示する
    # binding.pry
    @Bookings = Booking.where(guide_id: current_member.guide).order(updated_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
  end
end
