class KondutoPassenger
  require 'konduto-ruby/konduto_loyalty'

  attr_accessor :name, :document, :document_type, :dob, :nationality, :frequent_traveller, :special_needs, :loyalty

  TYPE_DOCUMENT = [:passport, :id]
  def initialize(*args)
    if args[0].nil?
      self.loyalty = KondutoLoyalty.new
    else
      if args[0][:loyalty].nil?
        self.loyalty = KondutoLoyalty.new
      else
        self.loyalty = KondutoLoyalty.new args[0][:loyalty]
        args[0].delete :loyalty
      end
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        name: self.name,
        document: self.document,
        document_type: self.document_type,
        dob: self.dob,
        nationality: self.nationality,
        frequent_traveller: self.frequent_traveller,
        special_needs: self.special_needs,
        loyalty: self.loyalty.to_hash
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
