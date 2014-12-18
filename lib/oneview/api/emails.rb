module Oneview
  module Api
    class Emails < Client
      require_all 'oneview/entity', 'email'
      
      base_uri "http://www.oneview.com.br/api/senders/send_email"
      
      def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header)) if data.is_a?(Hash)
        return parse_response(self.class.post("/", :body => build_body(data.as_parameter), :headers => header)) if data.is_a?(Oneview::Entity::Email)
        raise ArgumentError
      end
      alias :new :create
      
      private
        def build_body(parameters)
          super(parameters)
        end
    end
  end
end