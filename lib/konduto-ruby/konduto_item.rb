class KondutoItem < KondutoBase
  attributes :sku, :category, :name, :description, :product_code, :unit_cost, :quantity, :discount
  attribute created_at: :date
end
