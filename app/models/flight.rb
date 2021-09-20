class Flight < ApplicationRecord

  belongs_to :airline

  belongs_to :from_airport, class_name: :Airport
  belongs_to :to_airport, class_name: :Airport

  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings, dependent: :destroy



  def formatted_depart_date
    depart_date.strftime("%m/%d/%Y")
  end
  
  def formatted_time
    time.strftime('%l:%M%P')
  end

  
end

