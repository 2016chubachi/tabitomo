# Preview all emails at http://localhost:3000/rails/mailers/traveler_booking_mailer
class TravelerBookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/traveler_booking_mailer/send_new_booking
  def send_new_booking
    booking = Booking.first
    TravelerBookingMailer.send_new_booking(booking)
  end

  # Preview this email at http://localhost:3000/rails/mailers/traveler_booking_mailer/send_update_booking
  def send_update_booking
    @booking = Booking.first
    # binding.pry
    TravelerBookingMailer.send_update_booking(@booking)
  end

end
