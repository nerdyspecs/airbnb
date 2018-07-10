class ListingsController < ApplicationController
	def index
		@listings = Listing.page(params[:page]).per(5).all
	end
	
	def new
	end

	def create
		listing = Listing.new(listing_params)
		if listing.save
			@message = "you created a listing!"
			redirect_to listings_path
		else
			@message = "you failed to create a listing"
			redirect_to "listings#new"
		end
	end

	private
	def listing_params
		return params.require(:listing).permit(:address,:title, :guest, :bedroom, :baths, :min_stays,:price,:amenities=>[])
	end


end
