require 'spec_helper'

RSpec.describe Oneview::Api::Contacts do
  describe "creating" do
    let(:contact_params) {{:contact => {:name => "name", :email => "email"}, :access_token => "abc"}}
    let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
    
    describe "with raw parameters" do
      it "should post to the contacts url" do
        expect(Oneview::Api::Contacts).to receive(:post).with("/", :body => contact_params.to_json, :headers => header)
        
        Oneview.new("abc").contacts.create({:name => "name", :email => "email"})
      end
    end
    
    describe "with entity parameter" do
      it "should post to the contacts url" do
        contact = Oneview::Entity::Contact.new
      
        contact.name = "name"
        contact.email = "email@email.com"
        contact.birthday = "14/10/2014"
        contact.city = "city"
        contact.state = "state"
        contact.zip_code = "12233-444"
        
        phone = Oneview::Entity::Phone.new
        phone.country_code = "+55"
        phone.area_code = "12"
        phone.number = "998998789"
        
        contact.phone = phone
        
        dynamic_field = Oneview::Entity::DynamicField.new
        dynamic_field.name = "dynamic_field"
        dynamic_field.value = "123"
        
        contact.dynamic_fields << dynamic_field
      
        expect(Oneview::Api::Contacts).to receive(:post).with("/", :body => {:contact => contact.as_parameter, :access_token => "abc"}.to_json, :headers => header)
        
        Oneview.new("abc").contacts.create(contact)
      end
    end
    
    describe "with invalid parameter" do
      it "should raise ArgumentError when passing neither a Hash nor a Contact" do
        expect{Oneview.new("abc").contacts.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
end
