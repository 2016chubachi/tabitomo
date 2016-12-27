class TravelerBookingsController < ApplicationController
  before_action :authenticate_member!
  before_action :access_check!,except: [:index,:new,:create]

  def index
    # 更新が新しい順で表示する
    # binding.pry
    @bookings = Booking.where(traveler_id: current_member.traveler).order(updated_at: :desc).page(params[:page]).per(5)
    # binding.pry
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    if current_member.traveler.present?
      # binding.pry
      @guide = Guide.find(params[:guide_id])
      @member = current_member
      @traveler = current_member.traveler

      @booking = Booking.new
      @booking.assign_attributes(guide_id: @guide.id, traveler_id: @traveler.id,traveler_telphone: @member.telphone)

      @booking.booking_schedules.build
      @booking.build_traveler_booking_comment
      if params[:date].present? && params[:date].match(/\d{4}[-\/]\d{1,2}[-\/]\d{1,2}/)
        begin
          selectedDate = DateTime.parse(params[:date])
          bookinged = BookingSchedule.includes(:booking).where(bookings: {guide_id: @guide.id}).where(traveler_date: selectedDate.beginning_of_day..selectedDate.end_of_day)
          if selectedDate >= Date.today && bookinged.length <= 0
            @booking.booking_schedules[0].traveler_date = selectedDate
          end
        rescue
        end
      end
    else
      redirect_to top_url, notice: t(".rejected")
    end
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
      #TravelerBookingMailer.send_new_booking(@booking).deliver_now
      redirect_to traveler_booking_path(@booking), notice: t(".created")
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
      TravelerBookingMailer.send_update_booking(@booking).deliver_now
      redirect_to traveler_booking_path, notice: t(".updated")
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

  def access_check!
    # 自分のデータしかアクセスできない
    if !params[:id].present? || Booking.find(params[:id]).traveler != current_member.traveler
      raise t('access_error')
    end
  end


end
