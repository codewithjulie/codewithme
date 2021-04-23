ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # admin: 
  #   first_name: Julie
  #   last_name: J
  #   username: codewithjulie
  #   email: codewithjulie@gmail.com
  #   password: password
  #   password_confirmation: password
  #   admin: true

  # Add more helper methods to be used by all tests here...
  def sign_in_user(user, password)
    post login_path, params: {session: {username: user.username, password: password}}
  end

end
