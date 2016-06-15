module Konduto
  module Attributes
    def attributes(*attributes)
      attributes.each do |attribute|
        if attribute.is_a? Hash
          klass = attribute.values[0].to_s.gsub(/_/, ' ').split.map(&:capitalize).join('')
          type = Object::const_get(klass)
          name = attribute.keys[0]
        else
          name = attribute
        end

        self.send(:define_method, "#{name}=".to_sym) do |value|
          unless type.nil?
            if value.is_a?(String)
              value = type.parse(value) if type == Date || type == DateTime
              value = value.to_sym if type == Symbol
            end
          end

          instance_variable_set("@#{name.to_s.gsub(/[?|!]$/, '')}", value)
        end

        self.send(:define_method, name) do
          instance_variable_get("@#{name.to_s.gsub(/[?|!]$/, '')}")
        end
      end
    end

    alias :attribute :attributes
  end
end
