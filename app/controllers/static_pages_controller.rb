class StaticPagesController < ApplicationController
  

   def landing_page
   #def index
     # @products = Product.limit(3) 
      @products = Product.all
   end


	def thank_you
  		@name = params[:name]
  		@email = params[:email]
  		@message = params[:message]
  		UserMailer.contact_form(@email, @name, @message).deliver_now
	end

  

  def show
  end
 
  def new
  end

  def edit
  end

  def create
  end

  def update
  end
   
  def destroy
  end

end




