require 'spec_helper'

RSpec.describe Oneview::Api::Contacts do
  describe "creating" do
    let(:contact_params) {{:contact => {:name => "name", :email => "email"}, :access_token => "abc"}}
    let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
    
    before(:each) do
      dynamic_field = Oneview::Entity::DynamicField.new
      dynamic_field.name = "dynamic_field"
      dynamic_field.value = "123"
      
      phone = Oneview::Entity::Phone.new
      phone.country_code = "+55"
      phone.area_code = "12"
      phone.number = "998998789"
      
      @contact = Oneview::Entity::Contact.new
      @contact.name = "name"
      @contact.email = "email@email.com"
      @contact.birthday = "14/10/2014"
      @contact.city = "city"
      @contact.state = "state"
      @contact.zip_code = "12233-444"
      @contact.phone = phone
      @contact.dynamic_fields << dynamic_field
      
      stub_request(:post, "http://www.oneview.com.br/api/contacts/").to_return(:status => 200)
    end
    
    describe "with raw parameters" do
      it "should post to the contacts url" do
        expect(Oneview::Api::Contacts).to receive(:post).with("/", :body => contact_params.to_json, :headers => header).and_call_original
        
        Oneview.new("abc").contacts.create({:name => "name", :email => "email"})
      end
    end
    
    describe "with entity parameter" do
      it "should post to the contacts url" do
        expect(Oneview::Api::Contacts).to receive(:post).with("/", :body => {:contact => @contact.as_parameter, :access_token => "abc"}.to_json, :headers => header).and_call_original
        
        Oneview.new("abc").contacts.create(@contact)
      end
    end
    
    describe "with invalid parameter" do
      it "should raise ArgumentError when passing neither a Hash nor a Contact" do
        expect{Oneview.new("abc").contacts.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end

  describe "updating" do
    let(:contact_params) {{:contact => {:name => "name", :email => "email", :id => "23" }, :access_token => "abc"}}
    let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
    
    before(:each) do
      phone = Oneview::Entity::Phone.new
      phone.country_code = "+55"
      phone.area_code = "12"
      phone.number = "998998789"
      
      @contact = Oneview::Entity::Contact.new
      @contact.id = "23"
      @contact.name = "name"
      @contact.email = "email@email.com"
      @contact.birthday = "14/10/2014"
      @contact.city = "city"
      @contact.state = "state"
      @contact.zip_code = "12233-444"
      @contact.phone = phone
      
      stub_request(:patch, "http://www.oneview.com.br/api/contacts/23").to_return(:status => 200)
    end

    describe "with raw parameters" do
      it "should patch to the contacts url" do
        expect(Oneview::Api::Contacts).to receive(:patch).with("/" + contact_params[:contact][:id], :body => contact_params.to_json, :headers => header).and_call_original
        
        Oneview.new("abc").contacts.update("23",{:name => "name", :email => "email", :id => "23"})
      end
    end
    
    describe "with entity parameter" do
      it "should patch to the contacts url" do
        expect(Oneview::Api::Contacts).to receive(:patch).with("/" + @contact.id, :body => {:contact => @contact.as_parameter, :access_token => "abc"}.to_json, :headers => header).and_call_original
        
        Oneview.new("abc").contacts.update(@contact.id, @contact)
      end
    end
    
    describe "with invalid parameter" do
      it "should raise ArgumentError when passing neither a Hash nor a Contact" do
        expect{Oneview.new("abc").contacts.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
end
