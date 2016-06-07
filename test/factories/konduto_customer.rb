require 'date'

FactoryGirl.define do
  factory :konduto_customer do
    id '1'
    name 'José da Silva'
    email 'jose.silva@gmail.com'

    trait :complete do
      new? false
      vip? false
      phone1 '11987654321'
      phone2 '1133333333'
      tax_id '01234567890'
      created_at Date.new(2015, 6, 9)
    end
  end
end
