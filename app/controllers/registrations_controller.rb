


#def new_signup
     #ActionMailer::Base.mail(:from => 'lhardesty@hotmail.com', :to => 'lhardesty@hotmail.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver_now     
#end



#def new_signup
     #ActionMailer::Base.mail(:from => 'lhardesty@hotmail.com', :to => 'lhardesty@hotmail.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver_now
     
      #@email = params[:email]
       
      #ActionMailer::Base.mail(:from => @email,
          #:to => 'lhardesty@hotmail.com',
          #:subject => "A new contact form message from leanne",
          #:body => @email).deliver_now
     
      #@email = params[:email]
      #UserMailer.new_form(@email).deliver_now
  #end


def new_signup
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.new_form(@email, @name, @message).deliver_now
end