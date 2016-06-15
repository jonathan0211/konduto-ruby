module ClassMethods
  def validates_presence_of(*attributes)
    self.send(:define_method, :required_attr) do
      attributes
    end
  end

  def validates(*attributes, &block)
    if block_given?
      self.send(:define_method, :custom_validations) do
        { Proc.new(&block) => attributes }
      end
    end
  end
end
