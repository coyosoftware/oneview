require 'oneview/entity/base'

module Oneview
  module Entity
    class DynamicField < Base
      attr_accessor :name, :value
    end
  end
end