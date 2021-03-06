class GuideBookingsController < ApplicationController
  before_action :authenticate_member!
  before_action :access_check!,except: [:index]

  def index
    # 更新が新しい順で表示する
    # binding.pry
    @bookings = Booking.where(guide_id: current_member.guide).order(updated_at: :desc).page(params[:page]).per(5)

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.build_guide_booking_comment unless @booking.guide_booking_comment
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.assign_attributes(booking_params)
    @booking.assign_attributes(status_master_id: 2) if params[:approve]
    @booking.assign_attributes(status_master_id: 3) if params[:cancel]

    # binding.pry
    if @booking.save
      msg = t(".approved") if params[:approve]
      msg = t(".cancelled") if params[:rejected]
      redirect_to guide_booking_path, notice: msg
      # flash[:notice] = t(".approved") if params[:approve]
      # redirect_to guide_booking_path
    else
      render "edit"
    end
  end

  private
  def booking_params
    attrs = [:traveler_id, :guide_id, :traveler_telphone]
    attrs << {traveler_booking_comment_attributes: [:id, :traveler_id, :comment, :booking_id]}
    attrs << {guide_booking_comment_attributes: [:id, :guide_id, :comment, :booking_id]}
    params.require(:booking).permit(attrs)
  end

  def access_check!
    # 自分のデータしかアクセスできない
    if !params[:id].present? || current_member.guide != Booking.find(params[:id]).guide
      raise t('access_error')
    end
  end

end
