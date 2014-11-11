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
    
    require_all 'oneview/api', 'contacts'
    
    attr_accessor :access_token
    
    def initialize(access_token)
      raise NoAccessTokenError if access_token.nil? || access_token.strip == ""
      @access_token = access_token
    end
    
    def header
      {"Content-Type" => "application/json", "Accept" => "application/json"}
    end
    
    def build_body(parameters)
      parameters.merge(:access_token => @access_token).to_json
    end
    
    def contacts
      Oneview::Api::Contacts.new(@access_token)
    end
  end
end