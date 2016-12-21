require 'test_helper'

class TravelerBookingMailerTest < ActionMailer::TestCase

  test "send new booking" do
    @book = bookings(:booking_1)
    mail = TravelerBookingMailer.send_new_booking @book
    assert_equal "Tabitomo! 新規予約作成通知", mail.subject
    assert_equal ["#{@book.guide.member.email}"], mail.to
    assert_equal ["tabitomo2100@gmail.com"], mail.from
    assert_match @book.guide.member.first_name, mail.html_part.body.to_s
  end

  test "send update booking" do
    @book = bookings(:booking_2)
    mail = TravelerBookingMailer.send_update_booking @book
    assert_equal "Tabitomo! 予約変更通知", mail.subject
    assert_equal ["#{@book.guide.member.email}"], mail.to
    assert_equal ["tabitomo2100@gmail.com"], mail.from
    assert_match @book.guide.member.first_name, mail.html_part.body.to_s
  end

end
