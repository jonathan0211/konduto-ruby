class KondutoItem
  attr_accessor :sku, :category, :name, :description, :product_code, :unit_cost, :quantity, :discount, :created_at

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        sku: self.sku,
        category: self.category,
        name: self.name,
        description: self.description,
        product_code: self.product_code,
        unit_cost: self.unit_cost,
        quantity: self.quantity,
        discount: self.discount,
        created_at: self.created_at
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
