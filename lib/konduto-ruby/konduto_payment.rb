class KondutoPayment
  attr_accessor :type, :status, :bin, :last4, :expiration_date

  TYPE_PAYMENT = [:credit, :boleto, :debit, :transfer, :voucher]
  TYPE_STATUS = [:approved, :declined, :pending]

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        type: self.type,
        status: self.status,
        bin: self.bin,
        last4: self.last4,
        expiration_date: self.expiration_date
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
