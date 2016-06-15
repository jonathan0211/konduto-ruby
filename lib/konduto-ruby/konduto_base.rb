require_relative 'associations/associations'
require_relative 'validations/validations'
require_relative 'attributes'

class KondutoBase
  extend Konduto::Associations
  extend Konduto::Attributes
  include Konduto::Validations

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |key, value|
        unless value.nil?
          if respond_to? "#{key}=".to_sym
            send("#{key}=", value)
          elsif key == 'class'
            send('klass=', value)
          else
            instance_variable_set("@#{key}", value)
          end
        end
      end
    end
  end

  def to_hash
    Hash[
      instance_variables.map do |name|
        value = instance_variable_get(name)

        if value.respond_to? :each
          value = value.map {|v| v.to_hash }
        elsif !value.instance_variables.empty?
          value = value.to_hash
        elsif value.is_a?(Date) || value.is_a?(Symbol)
          value = value.to_s
        end

        [name == :@klass ? 'class' : name.to_s.gsub(/^@/, ''), value]
      end
    ]
  end

  def to_json
    raise RuntimeError, 'Invalid object for serialization' unless self.valid?
    self.to_hash.to_json
  end

  def ==(other)
    self.instance_variables.each do |name|
      return false unless self.instance_variable_get(name) == other.instance_variable_get(name)
    end

    true
  end
end
