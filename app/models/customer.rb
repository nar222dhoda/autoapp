class Customer < ActiveRecord::Base

  #Validation:
  validates :email, :first_name, :last_name, :phone, :address, presence: true
  validates_formatting_of :email, using: :email, if: '!email.blank?'

  #association with cars:
  # Customer can have many cars
  # Car details will be deleted with customer destroy so added dependent: :destroy
  has_many :cars, dependent: :destroy


  #After how many days we want to send notification to customer
  DEFAULT_INTERVAL = 30

  #Class method to send notification
  def self.next_servicing
    EMAIL_LOGGER.info("BODY:test")
    #(Date.today-Customer::DEFAULT_INTERVAL.days) :: Finding 30 days before date
    @car_details = CarDetail.group(:car_id).having('servicing_date = MAX(servicing_date)').having(servicing_date: (Date.today-Customer::DEFAULT_INTERVAL.days))
    @car_details.each do |car_detail|
      #Sending eails
      msg = ServicingNotificationMailer.servicing_notification(car_detail.car, car_detail.servicing_date).deliver_now
      EMAIL_LOGGER.info("sending email to : #{car_detail.car.customer.email}")
      EMAIL_LOGGER.info("BODY: #{msg}")
    end
  end

  def full_name
    first_name + " " + last_name
  end

end