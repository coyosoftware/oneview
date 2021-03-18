require 'spec_helper'

RSpec.describe Oneview::Client do
  before(:each) do
    Oneview::Client.send(:public, *Oneview::Client.protected_instance_methods)  
  end
  
  it "raises NoAccessTokenError when creating a new client without the access token" do
    expect { Oneview::Client.new("") }.to raise_error(Oneview::Client::NoAccessTokenError, "Please provide an access token")
  end
  
  it "returns the correct headers" do
    expect(Oneview::Client.new("abc").header).to eq({"Content-Type" => "application/json", "Accept" => "application/json"})
  end
  
  it "appends the access token to the parameters" do
    expect(Oneview::Client.new("abc").build_body(abc: "abc", def: "def")).to eq({ abc: "abc", def: "def", access_token: "abc" }.to_json)
  end
  
  it "returns an Oneview::Client::Response with the status" do
    stub_request(:post, "https://oneview.com.br/api/contacts/").to_return(status: 200)
    
    response = Oneview.new("abc").contacts.create(name: "name")
    
    expect(response.class).to eq(Oneview::Client::Response)
    expect(response.status).to eq(200)
  end
end