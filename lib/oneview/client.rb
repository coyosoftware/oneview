require "httparty"

module Oneview
  class Client
    class NoAccessTokenError < StandardError
      def message
        "Please provide an access token"
      end  
    end
    
    extend Oneview::ClassMethods
    include HTTParty
    
    require_all 'oneview/api', 'contacts', 'emails', 'sms'
    
    attr_accessor :access_token
    
    def initialize(access_token)
      raise NoAccessTokenError if access_token.nil? || access_token.strip == ""

      @access_token = access_token
    end
    
    def contacts
      Oneview::Api::Contacts.new(@access_token)
    end
    
    def emails
      Oneview::Api::Emails.new(@access_token)
    end

    def sms
      Oneview::Api::Sms.new(@access_token)
    end
    
    protected

    def header
      {"Content-Type" => "application/json", "Accept" => "application/json"}
    end
    
    def build_body(parameters)
      parameters.merge(:access_token => @access_token).to_json
    end
    
    def parse_response(response)
      return Oneview::Client::Response.new(response)
    end
    
    class Response
      attr_accessor :status, :payload, :raw_response
      
      def initialize(response)
        @status = response.code
        @payload = response.parsed_response
        @raw_response = response
      end
    end
  end
end