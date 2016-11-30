class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.booking_confirmed.subject
  #
  def booking_confirmed(booking)
    @booking = booking
    mail to: "#{booking.user.email},#{booking.room.user.email}"
  end
end
