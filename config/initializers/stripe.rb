

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['pk_live_uCV4XWu7jJbvXsCyZn2Bc3Wx'],
    :secret_key => ENV['sk_live_XCI6RMqkR3sms2FLTrYteaZX']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Ib8qFAMOjXgNjZ2yCs4N4Qu7',
    :secret_key => 'sk_test_5xghPRjZueXaZprsEPIEbtm8'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]