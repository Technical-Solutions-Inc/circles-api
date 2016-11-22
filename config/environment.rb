# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Sets JBuilder to use camelCase keys
# in the JSON by default
Jbuilder.key_format camelize: :lower
