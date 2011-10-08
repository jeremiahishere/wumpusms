# Be sure to restart your server when you modify this file.

Wumpus::Application.config.session_store :cookie_store, :key => '_wumpus_session'
ActionController::Base.session = {
  # this has been deleted to make this a public project
}


# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Wumpus::Application.config.session_store :active_record_store
