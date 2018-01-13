if ENV.fetch('COVERAGE', false)
  require 'simplecov'
  SimpleCov.start 'rails'
end

require 'capybara/rspec'
require 'constantcontact'
require 'shoulda-matchers'
require 'webmock/rspec'

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'
  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true)

def load_file(file_name)
  json = File.read(File.join(File.dirname(__FILE__), 'fixtures', file_name))
end