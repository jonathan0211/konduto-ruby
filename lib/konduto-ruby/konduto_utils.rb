class KondutoUtils
  def self.array_to_hash arr
    arr.map{ |pair| Hash[*pair] }
  end

  def self.remove_nil_keys_from_hash hash
    hash.delete_if { |k, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
  end

  def self.deep_symbolize_keys hash
    return hash.inject({}){|memo,(k,v)| memo[k.to_sym] = deep_symbolize_keys(v); memo} if hash.is_a? Hash
    return hash.inject([]){|memo,v    | memo           << deep_symbolize_keys(v); memo} if hash.is_a? Array
    return hash
  end
end
