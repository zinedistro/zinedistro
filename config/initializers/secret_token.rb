# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
fail 'You must set a secret token value' if ENV['SECRET_TOKEN'].blank?
ZineDistro::Application.config.secret_token = ENV['SECRET_TOKEN']

fail 'You must set a secret key base value' if ENV['SECRET_KEY_BASE'].blank?
ZineDistro::Application.config.secret_key_base = ENV['SECRET_KEY_BASE']
