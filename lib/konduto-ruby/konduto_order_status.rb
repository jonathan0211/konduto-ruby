class KondutoOrderStatus
  attr_accessor :status, :comments

  def self.allowed_status
    %w(APPROVED DECLINED NOT_AUTHORIZED CANCELLED FRAUD)
  end
  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        status: self.status,
        comments: self.comments
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
