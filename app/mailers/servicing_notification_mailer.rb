class ServicingNotificationMailer < ApplicationMailer

  def servicing_notification(car, date)
    @car = car
    @date = date
    @customer = @car.customer
    mail(to: @customer.email, subject: 'Next Servicing Notification')
  end
end
