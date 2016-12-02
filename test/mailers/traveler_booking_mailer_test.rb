require 'test_helper'

class TravelerBookingMailerTest < ActionMailer::TestCase
  test "send_new_booking" do
    mail = TravelerBookingMailer.send_new_booking
    assert_equal "Send new booking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_update_booking" do
    mail = TravelerBookingMailer.send_update_booking
    assert_equal "Send update booking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
