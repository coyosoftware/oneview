module Oneview
  module Entity
    class Phone
      attr_accessor :id, :number, :area_code, :country_code
      
      def as_parameter
        variables = instance_variables.map do |name|
          variable_name = name.to_s.tr("@", "")
          
          [variable_name, instance_variable_get(name)]
        end
         
        Hash[variables]
      end
    end
  end
end