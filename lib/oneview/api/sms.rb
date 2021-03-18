module Oneview
  module Api
    class Sms < Client
      require_all 'oneview/entity', 'sms'
      
      base_uri "https://oneview.com.br/api/senders/send_sms"
      
      def create(data)
        return parse_response(self.class.post("/", body: build_body(data), headers: header)) if data.is_a?(Hash)
        return parse_response(self.class.post("/", body: build_body(data.as_parameter), headers: header)) if data.is_a?(Oneview::Entity::Sms)

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