class KondutoGeolocation
  attr_accessor :city, :state, :country

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        city: self.city,
        state: self.state,
        country: self.country
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
