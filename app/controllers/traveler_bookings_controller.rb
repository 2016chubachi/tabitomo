class TravelerBookingsController < ApplicationController
  before_action :authenticate_member!
  before_action :check_traveler_booking_edit, only: [:edit, :update]
  # before_action :check_traveler_booking_edit

  def index
    # 更新が新しい順で表示する
    # binding.pry
    @bookings = Booking.where(traveler_id: current_member.traveler).order(updated_at: :desc)
    # binding.pry
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    # binding.pry
    @guide = Guide.find(params[:guide_id])
    @member = current_member
    @traveler = current_member.traveler

    @booking = Booking.new
    @booking.assign_attributes(guide_id: @guide.id, traveler_id: @traveler.id,traveler_telphone: @member.telphone)

    @booking.booking_schedules.build
    @booking.build_traveler_booking_comment
    # binding.pry
  end

  def edit
    # binding.pry
    @booking = Booking.find(params[:id])
    #traveler commentが存在しない場合、作成する。BuildしておかないとFormが作成されない
    #newで必ず作成されるので、いまは不要
    # @booking.build_traveler_booking_comment unless @booking.traveler_booking_comment
    # binding.pry
  end

  def create
    @booking = Booking.new(booking_params)
    # binding.pry
    @booking.assign_attributes(status_master_id: 1)
    # binding.pry
    if @booking.save
      # binding.pry
      redirect_to traveler_bookings_path
    else
      # binding.pry
      render "new"
    end
    # redirect_to traveler_bookings_path
    # render text: "travelerbooking create"
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.assign_attributes(booking_params)
    if @booking.save
      redirect_to traveler_booking_path, notice: t(".updated")
      #
    else
      render "edit"
      # binding.pry
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # 予約一覧画面（旅人）にredirectする
    redirect_to traveler_bookings_path, notice: t(".cancelled")
  end

  private
  def booking_params
    attrs = [:traveler_id, :guide_id, :traveler_telphone]
    attrs << {traveler_booking_comment_attributes: [:id, :traveler_id, :comment, :booking_id]}
    attrs << {booking_schedules_attributes: [:id, :traveler_date, :traveler_count, :city_master_id, :_destroy]}
    params.require(:booking).permit(attrs)
  end

  # 旅人の予約を変更可能か確認（自分の予約しか変更できない）
  def check_traveler_booking_edit
    # binding.pry
    redirect_to(top_url) unless Booking.find(params[:id]).traveler == current_member.traveler
  end

end
