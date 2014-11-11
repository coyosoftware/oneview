require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'debugger'
require 'oneview'
require 'webmock/rspec'

RSpec.configure do |config|
  config.mock_with :rspec
end