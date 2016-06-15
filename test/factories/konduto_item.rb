require 'date'

FactoryGirl.define do
  factory :konduto_item do
    trait :green_shirt do
      sku '9919023'
      product_code '123456789999'
      category 201
      name 'Green T-Shirt'
      description 'Male Green T-Shirt V Neck'
      unit_cost 1999.99
      quantity 1.0
    end

    trait :yellow_socks do
      sku '0017273'
      category 202
      name 'Yellow Socks'
      description 'Pair of Yellow Socks'
      unit_cost 29.9
      quantity 2.0
      discount 5.0
      created_at Date.new(2015, 6, 9)
    end
  end
end
