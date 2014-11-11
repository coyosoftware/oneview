require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'oneview'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => "codeclimate.com")

RSpec.configure do |config|
  config.mock_with :rspec
end