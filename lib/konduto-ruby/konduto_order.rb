class KondutoOrder < KondutoBase
  has_many :item, alias: :shopping_cart
  has_many :payment

  has_one :address, alias: :shipping
  has_one :address, alias: :billing
  has_one :customer
  has_one :seller
  has_one :travel
  has_one :device
  has_one :geolocation
  has_one :navigation

  attributes :id, :visitor, :timestamp, :total_amount, :tax_amount, :currency, :installments,
             :ip, :score, :analyze, :messages_exchanged, :shipping_amount

  attribute first_message: :date_time
  attribute purchased_at: :date_time
  attribute status: :symbol
  attribute recommendation: :symbol

  validates_presence_of :id, :total_amount, :customer
end
