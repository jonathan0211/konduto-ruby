class KondutoTravelInfo
  attr_accessor :date, :number_of_connections, :class, :fare_basis

  TRAVEL_CLASS = [:economy, :business, :first]

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        date: self.date,
        number_of_connections: self.number_of_connections,
        class: self.class,
        fare_basis: self.fare_basis
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
