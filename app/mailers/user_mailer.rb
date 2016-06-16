class UserMailer < ApplicationMailer

	default from: "lhardesty@hotmail.com"

  	def contact_form(email, name, message)
  		@message = message
    	mail(:from => email,
       	     :to => 'lhardesty@hotmail.com',
       	     :subject => "A new contact form message from #{name}")
  	end


  	def contact_form_signup(email)
  		#@message = message
    	mail(:from => 'lhardesty@hotmail.com',
       	     :to => email,
       	     :subject => "Your account with Bike the City")
  	end


end
