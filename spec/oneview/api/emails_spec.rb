require 'spec_helper'

RSpec.describe Oneview::Api::Emails do
  describe "creating" do
    let(:email_params) { { from: "from@email.com", to: "to@email.com", body: "body", subject: "subject", schedule: "14/05/2014 15:30", access_token: "abc" } }
    let(:header) { { "Content-Type" => "application/json", "Accept" => "application/json" } }
    
    before(:each) do
      @email = Oneview::Entity::Email.new
      @email.from = "from@email.com"
      @email.to = "to@email.com"
      @email.body = "body"
      @email.subject = "subject"
      @email.schedule = "14/05/2014 15:30"
      
      stub_request(:post, "https://oneview.com.br/api/senders/send_email/").to_return(status: 200)
    end
    
    describe "with raw parameters" do
      it "issues a post to the send email url" do
        expect(Oneview::Api::Emails).to receive(:post).with("/", body: email_params.to_json, headers: header).and_call_original
        
        Oneview.new("abc").emails.create(email_params)
      end
    end
    
    describe "with entity parameter" do
      it "issues a post to the send email url" do
        expect(Oneview::Api::Emails).to receive(:post).with("/", body: @email.as_parameter.merge(access_token: "abc").to_json, headers: header).and_call_original
        
        Oneview.new("abc").emails.create(@email)
      end
    end
    
    describe "with invalid parameter" do
      it "raises ArgumentError when passing neither a Hash nor an Email" do
        expect { Oneview.new("abc").emails.create(Array.new) }.to raise_error(ArgumentError)
      end
    end
  end
end
