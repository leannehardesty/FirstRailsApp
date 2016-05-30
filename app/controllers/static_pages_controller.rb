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
  		ActionMailer::Base.mail(:from => @email,
      	:to => 'lhardesty@hotmail.com',
     	:subject => "A new contact form message from #{@name}",
      	:body => @message).deliver_now
	end

	#def thank_you
  		#@name = params[:name]
  		#@email = params[:email]
  		#@message = params[:message]
  		#UserMailer.contact_form(@email, @name, @message).deliver_now
	#end
   

end




