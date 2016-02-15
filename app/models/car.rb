class Car < ActiveRecord::Base
  belongs_to :customer
  has_many :car_details, dependent: :destroy

  #Validation:
  validates :customer_id, :car_model, :color, presence: true
end
