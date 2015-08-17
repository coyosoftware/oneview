require 'spec_helper'

RSpec.describe Oneview::Api::Sms do
  describe "creating" do
    let(:sms_params) {{:numbers => "55129985587", :message => "message", :schedule => "14/05/2014 15:30", :access_token => "abc"}}
    let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
    
    before(:each) do
      @sms = Oneview::Entity::Sms.new
      @sms.numbers = "55129985587"
      @sms.message = "message"
      @sms.schedule = "14/05/2014 15:30"
      
      stub_request(:post, "http://www.oneview.com.br/api/senders/send_sms/").to_return(:status => 200)
    end
    
    describe "with raw parameters" do
      it "should post to the send sms url" do
        expect(Oneview::Api::Sms).to receive(:post).with("/", :body => sms_params.to_json, :headers => header).and_call_original
        
        Oneview.new("abc").sms.create(sms_params)
      end
    end
    
    describe "with entity parameter" do
      it "should post to the send sms url" do
        expect(Oneview::Api::Sms).to receive(:post).with("/", :body => @sms.as_parameter.merge(:access_token => "abc").to_json, :headers => header).and_call_original
        
        Oneview.new("abc").sms.create(@sms)
      end
    end
    
    describe "with invalid parameter" do
      it "should raise ArgumentError when passing neither a Hash nor an Sms" do
        expect{Oneview.new("abc").sms.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
end
