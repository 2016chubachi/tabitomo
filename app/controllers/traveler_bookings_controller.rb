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
    @Booking = Booking.find(params[:id])
    #traveler commentが存在しない場合、作成する。BuildしておかないとFormが作成されない
    @Booking.build_traveler_booking_comment unless @Booking.traveler_booking_comment
    # binding.pry
  end

  def update
    @Booking = Booking.find(params[:id])
    @Booking.assign_attributes(booking_params)
    if @Booking.save
      # showを作ってないので予約一覧画面（旅人）にredirectする
      redirect_to traveler_bookings_path
    else
      render "edit"
    end
  end

  private
  def booking_params
    attrs = [:traveler_first_name, :traveler_last_name, :traveler_email, :traveler_telphone, :traveler_country, :traveler_id]
    attrs << {traveler_booking_comment_attributes: [:id, :traveler_id, :comment, :booking_id]}
    attrs << {booking_schedules_attributes: [:id, :traveler_date, :traveler_count, :city_master_id]}
    params.require(:booking).permit(attrs)
  end

end
