class ListingsController < ApplicationController

	def index
		@listings = Listing.page(params[:page]).per(5).all
	end

	def new		
	end

	def create
		listing = Listing.new(listing_params)
		listing.user_id = current_user.id
		byebug
		if listing.save
			@message = "you created a listing!"
			redirect_to listings_path
		else
			@message = "you failed to create a listing"
			redirect_to "listings#new"
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def search
		@listing = Listing.all
		@listing = @listing.check_title(params[:search])
		p"hehe"
		respond_to do |format|
			format.html
			format.json {render json:@listing}
		end
	end

	private
	def listing_params
		return params.require(:listing).permit(:description,:city,:address,:title, :guest, :bedroom, :baths, :min_stays,:price,{images: []},:amenities=>[])
	end


end
