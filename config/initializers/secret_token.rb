# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# AdventureLibrary::Application.config.secret_key_base = "ENV['SECRET_KEY_BASE']"
# AdventureLibrary::Application.config.secret_key_base ||= "not a good secret key" if ["development", "test"].include?(Rails.env)
AdventureLibrary::Application.config.secret_key_base = "a9ec0ef1aca3287b8b8b3815ce7756551721271a59a7895732210bd76f33034b3f29dcb74f9466f37b6877765319ced790cdd07c5ad207ad6aeacb248e5eef14"

