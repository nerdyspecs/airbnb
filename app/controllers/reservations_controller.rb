class ReservationsController < ApplicationController
	def new
		@listing = Listing.find(params[:listing_id])
	end


	def create
		reservation = Reservation.new(reservation_params)
		reservation.user_id = current_user.id
		reservation.listing_id = params[:listing_id]
		reservation.payment = 0
		if reservation.save
			ReservationJob.perform_later(reservation.user , reservation.listing, reservation)

			

			redirect_to listing_reservation_path(reservation.listing_id,reservation.id)
		else
			redirect_to homepage_path
		end
		
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	private

	def reservation_params
		return params.require(:reservation).permit(:check_in,:check_out)
	end
end
