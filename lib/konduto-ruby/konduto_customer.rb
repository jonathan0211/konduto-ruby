class KondutoCustomer < KondutoBase
  attributes :id, :name, :email, :new?, :vip?, :phone1, :phone2, :tax_id
  attribute created_at: :date

  validates_presence_of :id, :name, :email
end
