class KondutoDevice
  attr_accessor :user_id, :fingerprint, :platform, :browser, :language, :timezone, :cookie, :javascript, :flash, :ip

  def initialize(*args)
    unless args[0].nil?
      args[0].each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_hash
    hash = {
        user_id: self.user_id,
        fingerprint: self.fingerprint,
        platform: self.platform,
        browser: self.browser,
        language: self.language,
        timezone: self.timezone,
        cookie: self.cookie,
        javascript: self.javascript,
        flash: self.flash,
        ip: self.ip
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end
end
