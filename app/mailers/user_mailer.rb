class UserMailer < ApplicationMailer

	default from: "lhardesty@hotmail.com"

  	def contact_form(email, name, message)

  		@message = message
    	mail(:from => email,
       	     :to => 'lhardesty@hotmail.com',
       	     :subject => "A new contact form message from #{name}")
  	end


  	def new_form(email, name, message)
  		@message = message
    	mail(:from => email,
       	     :to => 'lhardesty@hotmail.com',
       	     :subject => "Your account with Bike the City is setup for:...")
  	end


end
