# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_unetnuevo_session',
  :secret      => '97db753c0ca99995bf3c684f15a52ef4ee3e30289cb488730b55ce14f90d16be9a7490a52c7d736cacd6f180738314732e35fad8595215edd5cc59cf8dc337b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
