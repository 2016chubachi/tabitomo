class TravelerBookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.traveler_booking_mailer.send_new_booking.subject
  #
  def send_new_booking(booking)
    @booking = booking
    mail to: @booking.guide.member.email,subject: "Tabitomo! 新規予約作成通知"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.traveler_booking_mailer.send_update_booking.subject
  #
  def send_update_booking(booking)
    # binding.pry
    @booking = booking
    mail to: @booking.guide.member.email,subject: "Tabitomo! 予約変更通知"
  end
end
