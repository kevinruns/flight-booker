class PassengerMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def confirmation_email
    booking = Booking.find(params[:booking_id])
    emails = booking.passengers.pluck(:email)
    mail(to: emails, subject: 'Booking confirmed')
  end

end
