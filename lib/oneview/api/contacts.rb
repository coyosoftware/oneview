module Oneview
  module Api
    class Contacts < Client
      require_all 'oneview/entity', 'contact', 'dynamic_field', 'phone'
      
      base_uri "http://www.oneview.com.br/api/contacts"
      
      def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header)) if data.is_a?(Hash)
        return parse_response(self.class.post("/", :body => build_body(data.as_parameter), :headers => header)) if data.is_a?(Oneview::Entity::Contact)
        raise ArgumentError
      end
      alias :new :create
      
      private
        def build_body(parameters)
          super({:contact => parameters})
        end
    end
  end
end