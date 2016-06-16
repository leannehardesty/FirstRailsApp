# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("lhardesty@hotmail.com", "John", "Hello World!")
  end


  def new_form
    UserMailer.new_form("lhardesty@hotmail.com", "John", "Hello World!")
  end



end