class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :date_validation
	before_save :price
	enum payment: [:notpaid, :paid]

	def date_validation
		if check_in.present? && check_in < Date.today
	    	errors.add(:checkin, "can't be in the past")
	    else
	    	if check_out>check_in
	    		return true
	    	else
	    		errors.add(:check_out, "has to come after checkin")
	      		return false
	    	end
	    end
	end

	def price
		self.price = (check_out - check_in).to_i* self.listing.price
	end

end
