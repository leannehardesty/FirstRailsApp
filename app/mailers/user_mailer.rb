class UserMailer < ApplicationMailer

	default from: "lhardesty@hotmail.com"

  	def contact_form(email, name, message)

  		@message = message
    	mail(:from => email,
       	     :to => 'lhardesty@hotmail.com',
       	     :subject => "A new contact form message from #{name}")
  	end


  	def welcome(user)
      @appname = "Bike the City"
      mail( :to => user.email,
            :subject => "Welcome to #{@appname}!")
    end

    def purchase(user)
      @appname = "Bike the City"
      mail( :to => user.email,
            :subject => "Thank you for your recent online purchase at #{@appname}!")
    end


end
