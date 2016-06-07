require 'date'

FactoryGirl.define do
  factory :konduto_passenger do
    frequent_traveler false
    sequence(:name) { |n| "Milton Tavares #{n}" }
    sequence(:document) { |n| "A1B2C3D#{n}" }
    document_type :passport
    special_needs false

    trait :basic do
      name 'Júlia da Silva'
      document 'A1B2C3D4'
      document_type :id
    end

    trait :complete do
      dob Date.new(1970, 1, 1)
      nationality 'BR'
      frequent_traveler true
      special_needs false
      loyalty_program 'advantage'
      loyalty_category 'gold'
    end

    trait :fixed_complete do
      name 'Júlia da Silva'
      document 'A1B2C3D4'
      document_type :id
      dob Date.new(1970, 1, 1)
      nationality 'BR'
      frequent_traveler true
      special_needs false
      loyalty factory: :konduto_loyalty, strategy: :build
    end
  end
end
