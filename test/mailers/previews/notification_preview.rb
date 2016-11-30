# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/booking_confirmed
  def booking_confirmed
    Notification.booking_confirmed
  end

end
