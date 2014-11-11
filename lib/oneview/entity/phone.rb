require 'oneview/entity/base'

module Oneview
  module Entity
    class Phone < Base
      attr_accessor :id, :number, :area_code, :country_code
    end
  end
end