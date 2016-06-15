class KondutoPayment < KondutoBase
  attributes :expiration_date, :bin, :last4
  attribute type: :symbol
  attribute status: :symbol

  TYPE_PAYMENT = [:credit, :boleto, :debit, :transfer, :voucher]
  TYPE_STATUS = [:approved, :declined, :pending]
end
