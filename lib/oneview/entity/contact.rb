module Oneview
  module Entity
    class Contact
      attr_accessor :id, :name, :birthday, :email, :city, :state, :zip_code, :address, :phone, :dynamic_fields
      
      def initialize
        self.phone = Phone.new
        self.dynamic_fields = Array.new
      end
      
      def as_parameter
        variables = instance_variables.map do |name|
          case name
            when :@phone
              ["phone_attributes", instance_variable_get(name).as_parameter]
            when :@dynamic_fields
            else 
              [name.to_s.tr("@", ""), instance_variable_get(name)]
          end
        end
        
        self.dynamic_fields.each do |dynamic_field|
          variables << [dynamic_field.name, dynamic_field.value]
        end
        
        Hash[variables.compact]
      end
    end
  end
end