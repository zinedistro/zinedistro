# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
if Rails.env.test? || Rails.env.development? || Rails.env == "profile"
  DistroNew::Application.config.secret_token = "k4ycDncmDors9PzaBjE72Q9NiLuQu7Bq3Lxw28P8VRMCEfPEuEEW23AUF7yj9iTcmApWVqeZzzMGBCKpn9QJ7YyAZoFuq7pm873uww9Zcf9xJ33ppXFuGvqgLyWhz99CZFfx8vW6TjqCLyJ8BF6HfP"
  DistroNew::Application.config.secret_key_base = DistroNew::Application.config.secret_token
else
  raise "You must set a secret token in ENV['SECRET_TOKEN'] or in config/initializers/secret_token.rb" if ENV['SECRET_TOKEN'].blank?
  DistroNew::Application.config.secret_token = ENV['SECRET_TOKEN']
  DistroNew::Application.config.secret_key_base = DistroNew::Application.config.secret_token
end
