require 'spec_helper'

RSpec.describe Oneview::Entity::DynamicField do
  describe "as_parameter" do
    let(:dynamic_field_as_parameter) {{"name" => "dynamic_field", "value" => "abc"}}
      
    it "should return the dynamic_field as parameter" do
      dynamic_field = Oneview::Entity::DynamicField.new
      dynamic_field.name = "dynamic_field"
      dynamic_field.value = "abc"
      
      expect(dynamic_field.as_parameter).to eq(dynamic_field_as_parameter)
    end
  end
end
