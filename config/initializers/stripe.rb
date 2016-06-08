

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Ib8qFAMOjXgNjZ2yCs4N4Qu7',
    :secret_key => 'sk_test_5xghPRjZueXaZprsEPIEbtm8'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]