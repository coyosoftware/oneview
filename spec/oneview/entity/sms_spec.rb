require 'spec_helper'

RSpec.describe Oneview::Entity::Sms do
  describe "as_parameter" do
    let(:sms_as_parameter) { { "numbers" => "5512998998798", "message" => "Bodys Test" } }
      
    it "returns the sms as parameter" do
      sms = Oneview::Entity::Sms.new

      sms.message = "Bodys Test"
      sms.numbers = "5512998998798"
      
      expect(sms.as_parameter).to eq(sms_as_parameter)
    end
  end
end
