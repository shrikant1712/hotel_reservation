class ReservationMailer < ApplicationMailer
  default from: Settings.email_address
  layout 'mailer'

  def reservation_confirm_email(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email, subject: 'Reservation confirmation!!!')
  end
end
