FactoryGirl.define do
  factory :konduto_payment do
    trait :credit_card do
      bin '123'
      expiration_date '012014'
      last4 '1234'
      status :approved
      type :credit
    end
  end
end
