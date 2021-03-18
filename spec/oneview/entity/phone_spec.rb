require 'spec_helper'

RSpec.describe Oneview::Entity::Phone do
  describe "as_parameter" do
    let(:phone_as_parameter) { { "number" => "999999999", "area_code" => "12", "country_code" => "+55" } }
      
    it "returns the phone as parameter" do
      phone = Oneview::Entity::Phone.new
      phone.country_code = "+55"
      phone.area_code = "12"
      phone.number = "999999999"
      
      expect(phone.as_parameter).to eq(phone_as_parameter)
    end
  end
end
