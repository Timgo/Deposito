# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_deposito_session',
  :secret      => '68081147e132249714a89aee857f0ab97041fba7fad37a43c704a4652f25b2fec6f741cf3e92a31cea6e0709afecb30cdad75ee7422c16409a8362e8bc16e5f4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
