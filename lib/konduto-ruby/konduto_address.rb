class KondutoAddress
  attr_accessor :name, :address1, :address2, :city, :state, :country, :zip

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        name: self.name,
        address1: self.address1,
        address2: self.address2,
        city: self.city,
        state: self.state,
        country: self.country,
        zip: self.zip
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
