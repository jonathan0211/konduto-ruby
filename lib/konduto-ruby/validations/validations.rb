require_relative 'class_methods'

module Konduto
  module Validations
    def self.included(base)
      base.class_eval do
        extend ClassMethods
      end
    end

    def valid?
      if respond_to? :required_attr
        required_attr.each do |attr|
          return false if send(attr).nil?
        end
      end

      if respond_to? :custom_validations
        custom_validations.each do |block, attrs|
          attrs.each { |attr| return false unless block.call(send(attr)) } if attrs.is_a? Array
        end
      end

      true
    end
  end
end
