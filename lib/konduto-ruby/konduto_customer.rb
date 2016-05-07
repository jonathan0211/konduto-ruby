class KondutoCustomer
  attr_accessor :id, :name, :email, :dob, :tax_id, :phone1, :phone2, :created_at, :new, :vip

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        id: self.id,
        name: self.name,
        email: self.email,
        dob: self.dob,
        tax_id: self.tax_id,
        phone1: self.phone1,
        phone2: self.phone2,
        created_at: self.created_at,
        new: self.new,
        vip: self.vip
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
