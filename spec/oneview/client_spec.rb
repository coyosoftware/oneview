require 'spec_helper'

RSpec.describe Oneview::Client do
  it "should raise NoAccessTokenError when creating a new client without the access token" do
    expect{Oneview::Client.new("")}.to raise_error(Oneview::Client::NoAccessTokenError, "Please provide an access token")
  end
  
  it "should return the correct headers" do
    expect(Oneview::Client.new("abc").header).to eq({"Content-Type" => "application/json", "Accept" => "application/json"})
  end
  
  it "should append the access token to the parameters" do
    expect(Oneview::Client.new("abc").build_body({:abc => "abc", :def => "def"})).to eq({:abc => "abc", :def => "def", :access_token => "abc"}.to_json)
  end
end