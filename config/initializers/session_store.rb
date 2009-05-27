# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_frosh_session',
  :secret      => 'daa8a82d606494e9d77136f0bb348d0933918deeefa5bfe9b3e2f477869c3650e13deafb51222ee7497eda83aa7141b6ade6152184287afa95df95c784b76508'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
