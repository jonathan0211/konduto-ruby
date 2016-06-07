require 'date'

FactoryGirl.define do
  factory :konduto_order do
    id "1"
    total_amount 120.5

    customer factory: :konduto_customer, strategy: :build

    trait :complete do
      analyze true
      visitor "a9031kdlas"
      currency 'USD'
      installments 1
      ip '192.168.0.1'
      shipping_amount 5.0
      tax_amount 3.0
      timestamp 123123123123
      customer factory: [:konduto_customer, :complete], strategy: :build
      shipping factory: :konduto_address, strategy: :build
      billing factory: :konduto_address, strategy: :build
      geolocation factory: :konduto_geolocation, strategy: :build
      status :approved
      recommendation :approve
      payment { build_list :konduto_payment, 1, :credit_card }
      shopping_cart { [build(:konduto_item, :green_shirt), build(:konduto_item, :yellow_socks)] }
      travel factory: :konduto_travel, strategy: :build
      first_message DateTime.new(2015, 6, 9, 18, 27, 1)
      purchased_at DateTime.new(2015, 6, 9, 18, 27, 1)
      messages_exchanged 2
      seller factory: :konduto_seller, strategy: :build
    end
  end
end
