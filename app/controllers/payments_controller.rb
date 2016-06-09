class PaymentsController < ApplicationController

	def create
		@product = params[:product_id]
		@price = params[:product_price]  
		@user = current_user
  		token = params[:stripeToken]
  		# Create the charge on Stripe's servers - this will charge the user's card
  		begin
    	  charge = Stripe::Charge.create(
	      :amount =>  @price.to_i * 100, # amount in cents, again
	      :currency => "usd",
	      :source => token,
	      :description => params[:stripeEmail]
    		)


    	  #was the payment successful / conditional check


    	  if charge.paid
    	  	Order.create(
    	  		:product_id => @product,
    	  		:user_id => @user,
    	  		:total => @price
    	  		)
    	  end




  		  rescue Stripe::CardError => e

    	  # The card has been declined
  		  end


  		#redirect_to product_url(@product)  
  		  
    	respond_to do |format|
      		format.html { redirect_to product_url(@product), notice: 'Thank you for your purchase.' }
      		format.json { head :no_content }
    	end
  		 
	end



end
