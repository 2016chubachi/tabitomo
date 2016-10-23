class TravelerBookingsController < ApplicationController
  def index
    # ログイン機能ができるまでの暫定
    # 更新が新しい順で表示する
    @Bookings = Booking.where(traveler_id: 4).order(updated_at: :desc)
    # @Bookings = Booking.find(1)
  end

  def show
  end

  def new
  end

  def edit
  end
end
