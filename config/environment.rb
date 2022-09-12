# Load the Rails application.
require_relative "application"

Rails.application.configure do
 config.hosts << "crowd-pqa.xyz"
end

# Initialize the Rails application.
Rails.application.initialize!
