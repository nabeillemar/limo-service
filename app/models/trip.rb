class Trip < ApplicationRecord
    belongs_to :user 
    belongs_to :driver, optional: true
    validates :client_name, :pick_up_time, :reservation_date, :passengers, :pick_up, :drop_off, presence: true
    validates :client_name, length: { minimum: 2 }
#add validations for other attributes 


scope :order_by_reservation_date, -> {order(reservation_date: :desc)}


    
end 