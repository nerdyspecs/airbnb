class ReservationMailer < ApplicationMailer
	default from: "jjkohtest@gmail.com"
	layout 'mailer'

	def reservation_email(user,listing,reservation)
	  @user = user
	  @listing = listing
	  @reservation = reservation
	  @url  = "http://localhost:3000/listings/#{@listing.id}/reservations/#{@reservation.id}"

	  mail(to:"jjkohtest@gmail.com", subject: "Your reservation at \"#{@listing.title}\" has been made!")
	end

	def listing_email(user,listing,reservation)
		@user = user
		@listing = listing
		@reservation = reservation
		@url  = "http://localhost:3000/listings/#{@listing.id}/reservations/#{@reservation.id}"

		mail(to:"jjkohtest@gmail.com", subject:"You had a reservation at your listing, \"#{@listing.title}\")
	end
end
