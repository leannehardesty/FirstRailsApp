class PaymentsController < ApplicationController


    
   def index
   end

   def show
   end

   def new
   end

   def edit
   end


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

          UserMailer.purchase(@user).deliver_now
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
  

  def update
  end

  def destroy
  end
end
