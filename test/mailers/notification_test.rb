require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "booking_confirmed" do
    mail = Notification.booking_confirmed
    assert_equal "Booking confirmed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
