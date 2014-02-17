# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
AdventureLibrary::Application.config.secret_key_base = '2ba9e0756a4bbba39908309c541b3d17e8c8ff2938b2202ce1038486dbd60a3bf645a088f7e89b382573d450014606ff6e2a313b4c43a267a21e9b8fe374e527'
# AdventureLibrary::Application.config.secret_key_base ||= "not a good secret key" if ["development", "test"].include?(Rails.env)
