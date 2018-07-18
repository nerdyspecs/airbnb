class UsersController < Clearance::UsersController
	def homepage		
	end

	def new
	end

	def show

		@user = User.find(params[:id])
		# @picture = MiniMagick::Image.new(@user.image)
		# @picture.resize("100x100")
		if current_user.id == params[:id].to_i
			@owner = true
		end
		
		@listings = @user.listings
	end

	def edit
		@user = User.find(params[:id])
	end

	def reservations
		@reservations = Reservation.where("user_id": params[:id])
	end

	def update
		password = params[:user][:password]
		email = params[:user][:email]
		image = params[:user][:image]
		name = params[:user][:name]
		user = User.find(params[:id])

		if user.update(password:password, email:email,name:name,image:image)
			flash[:update_status] = "Your profile has been updated!"
			redirect_to homepage_path
		else
			flash[:update_status] = "Your profile has failed to update."
			redirect_to homepage_path
		end
	end

	def create
		User.create(user_params)

		redirect_to root_path
	end

	private
	def user_params
		return params.require(:user).permit(:name,:email,:image,:password,role:1)
	end


end