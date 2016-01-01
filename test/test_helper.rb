#I might need to get rid of this - Since Active Records is no longer used
# http://stackoverflow.com/questions/19078044/disable-activerecord-for-rails-4
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # Commented it out when I am not using Active Record/nor fixtures


  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests (This is for integration testing)
  include Capybara::DSL
  Capybara.default_driver = :selenium
end
