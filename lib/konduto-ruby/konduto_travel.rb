class KondutoTravel
  require 'konduto-ruby/konduto_travel_info'
  require 'konduto-ruby/konduto_utils'
  attr_accessor :type, :departure, :return, :passengers
  TYPE_TRAVEL = [:flight, :bus]

  def initialize(*args)
    self.passengers = []

    if args[0].nil?
      self.departure = KondutoTravelInfo.new
      self.return = KondutoTravelInfo.new
    else
      if args[0][:departure].nil?
        self.departure = KondutoTravelInfo.new
      else
        self.departure = KondutoTravelInfo.new args[0][:departure]
        args[0].delete :departure
      end
      if args[0][:return].nil?
        self.return = KondutoTravelInfo.new
      else
        self.return = KondutoTravelInfo.new args[0][:return]
        args[0].delete :return
      end

      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def add_passenger (passenger)
    self.passengers << passenger
  end

  def to_hash
    hash = {
        type: self.type,
        departure: self.departure.to_hash,
        return: self.return.to_hash,
        passengers: KondutoUtils.array_to_hash(self.passengers)
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
