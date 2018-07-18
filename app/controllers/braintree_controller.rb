class BraintreeController < ApplicationController
  	def new
  		if params[:id] == nil
  			redirect_to sign_in_path
  		else
	  		@reservation = Reservation.find(params[:id])
		  	@client_token = Braintree::ClientToken.generate  	
	  	end
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  result = Braintree::Transaction.sale(
	   :amount => "10.00", #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	reservation = Reservation.find(params[:id])
	  	reservation.update(payment:1)
	    redirect_to listings_path, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end

end
