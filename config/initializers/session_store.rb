# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lunatic_session',
  :secret      => '54323ab63fc426715da93c2afa9ac3b11976e5b2a71567cab09fb9184dddf351b528a3e299b04212949c4c30104f9e93dc218eebfd43197e703edae94cd3c97c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
