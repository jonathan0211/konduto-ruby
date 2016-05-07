class KondutoNavigation
  attr_accessor :session_time, :referrer, :time_site_1d, :new_accounts_1d, :password_resets_1d, :sales_declined_1d,\
                :sessions_1d, :time_since_last_sale, :time_site_7d, :time_per_page_7d, :new_accounts_7d, \
                :password_resets_7d, :checkout_count_7d, :sales_declined_7d, :sessions_7d
  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        session_time: self.session_time,
        referrer: self.referrer,
        time_site_1d: self.time_site_1d,
        new_accounts_1d: self.new_accounts_1d,
        password_resets_1d: self.password_resets_1d,
        sales_declined_1d: self.sales_declined_1d,
        sessions_1d: self.sessions_1d,
        time_since_last_sale: self.time_since_last_sale,
        time_site_7d: self.time_site_7d,
        time_per_page_7d: self.time_per_page_7d,
        new_accounts_7d: self.new_accounts_7d,
        password_resets_7d: self.password_resets_7d,
        checkout_count_7d: self.checkout_count_7d,
        sales_declined_7d: self.sales_declined_7d,
        sessions_7d: self.sessions_7d,
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
