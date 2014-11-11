require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'debugger'
require 'oneview'

RSpec.configure do |config|
  config.mock_with :rspec
end