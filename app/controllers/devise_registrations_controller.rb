


def new_signup
     ActionMailer::Base.mail(:from => 'lhardesty@hotmail.com', :to => 'lhardesty@hotmail.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver_now     
end