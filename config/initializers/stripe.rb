

if Rails.env.production?
  Rails.configuration.stripe = {
   :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
   :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_azpC3c16eBvCvHsD6JICAUks',
    :secret_key => 'sk_test_5xghPRjZueXaZprsEPIEbtm8'

  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]




# test:  sk_test_5xghPRjZueXaZprsEPIEbtm8
# test:  pk_test_azpC3c16eBvCvHsD6JICAUks


# prod:  sk_live_XCI6RMqkR3sms2FLTrYteaZX
# prod:  pk_live_uCV4XWu7jJbvXsCyZn2Bc3Wx
 

 #  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
 #  :secret_key => ENV['STRIPE_SECRET_KEY']
 
