module Konduto
  module Associations

    def has_one(model, options = {})
      name = options[:alias] || model

      self.send(:define_method, name) do
        instance_variable_get("@#{name}")
      end

      self.send(:define_method, "#{name}=".to_sym) do |value|
        klass = "Konduto#{model.to_s.gsub(/_/, ' ').split.map(&:capitalize).join('')}"

        if value.class.to_s == klass
          instance_variable_set("@#{name}", value)
        elsif value.is_a? Hash
          instance_variable_set("@#{name}", Object::const_get(klass).new(value))
        else
          raise ArgumentError, "Expected class #{klass}, got #{value.class} at #{self.class}"
        end
      end
    end

    def has_many(model, options = {})
      name = options[:alias] || model

      self.send(:define_method, name) do
        instance_variable_set("@#{name}", []) if instance_variable_get("@#{name}").nil?

        instance_variable_get("@#{name}")
      end

      self.send(:define_method, "#{name}=".to_sym) do |arr|
        klass = "Konduto#{model.to_s.gsub(/_/, ' ').split.map(&:capitalize).join('')}"
        temp_arr = []

        arr.each do |value|
          if value.class.to_s == klass
            temp_arr << value
          elsif value.is_a? Hash
            temp_arr << Object::const_get(klass).new(value)
          else
            raise ArgumentError, "Expected class #{klass}, got #{value.class} at #{self.class}"
          end
        end

        instance_variable_set("@#{name}", temp_arr)
      end
    end
  end
end
