if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_enQ7dBpqUqCqrpiERsCqktBl',
    :secret_key => 'sk_test_F84SdZD7TM50mi3utgZOZjyC'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

#Stripe.api_key = Rails.configuration.stripe[:publishable_key]