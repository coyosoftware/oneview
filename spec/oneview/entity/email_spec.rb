require 'spec_helper'

RSpec.describe Oneview::Entity::Email do
  describe "as_parameter" do
    let(:email_as_parameter) { { "from" => "test@test.com", "to" => "test2@test2.com", "body" => "Bodys Test", "subject" => "Subjects Test" } }
      
    it "returns the email as parameter" do
      email = Oneview::Entity::Email.new
      
      email.from = "test@test.com"
      email.to = "test2@test2.com"
      email.body = "Bodys Test"
      email.subject = "Subjects Test"
      
      expect(email.as_parameter).to eq(email_as_parameter)
      end
  end
end
