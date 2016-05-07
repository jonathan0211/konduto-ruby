class KondutoOrder
  require 'konduto-ruby/konduto_address'
  require 'konduto-ruby/konduto_customer'
  require 'konduto-ruby/konduto_device'
  require 'konduto-ruby/konduto_navigation'
  require 'konduto-ruby/konduto_geolocation'
  require 'konduto-ruby/konduto_seller'
  require 'konduto-ruby/konduto_payment'
  require 'konduto-ruby/konduto_item'
  require 'konduto-ruby/konduto_travel'
  require 'konduto-ruby/konduto_utils'
  require 'json/pure'

  attr_accessor :id, :visitor, :timestamp, :total_amount, :shipping_amount, :tax_amount, :customer, :currency, \
                :installments, :ip, :score, :shipping_address, :billing_address, :recommendation, :status, \
                :geolocation, :analyze, :messages_enchanged, :first_message, :purchased_at, :seller, :payment, \
                :shopping_cart, :device, :navigation, :travel

  def initialize(*args)
    params = args[0]
    self.shopping_cart = []
    self.payment = []
    if params.nil?
      self.shipping_address = KondutoAddress.new
      self.billing_address = KondutoAddress.new
      self.customer = KondutoCustomer.new
      self.seller = KondutoSeller.new
      self.travel = KondutoTravel.new
      self.device = KondutoDevice.new
      self.geolocation = KondutoGeolocation.new
    else
      params = KondutoUtils.deep_symbolize_keys params
      if params[shipping_address].nil?
        self.shipping_address = KondutoAddress.new
      else
        self.shipping_address = KondutoAddress.new params[:shipping_address]
        params.delete :shipping_address
      end

      if params[:billing_address].nil?
        self.billing_address = KondutoAddress.new
      else
        self.billing_address = KondutoAddress.new params[:billing_address]
        params.delete :billing_address
      end

      if params[:customer].nil?
        self.customer = KondutoCustomer.new
      else
        self.customer = KondutoCustomer.new params[:customer]
        params.delete :customer
      end

      if params[:seller].nil?
        self.seller = KondutoSeller.new
      else
        self.seller = KondutoSeller.new params[:seller]
        params.delete :seller
      end

      if params[:travel].nil?
        self.travel = KondutoTravel.new
      else
        self.travel = KondutoTravel.new params[:travel]
        params.delete :travel
      end

      if params[:device].nil?
        self.device = KondutoDevice.new
      else
        self.device = KondutoDevice.new params[:device]
        params.delete :device
      end

      if params[:geolocation].nil?
        self.geolocation = KondutoGeolocation.new
      else
        self.geolocation = KondutoGeolocation.new params[:geolocation]
        params.delete :geolocation
      end

      if params[:navigation].nil?
        self.navigation = KondutoNavigation.new
      else
        self.navigation = KondutoNavigation.new params[:navigation]
        params.delete :navigation
      end

      unless params[:payment].nil? || params[:payment].empty?
        params[:payment].each do |p|
          self.payment << KondutoPayment.new(p)
        end
        params.delete :payment
      end

      unless params[:shopping_cart].nil? || params[:shopping_cart].empty?
        params[:shopping_cart].each do |i|
          self.shopping_cart << KondutoItem.new(i)
        end
        params.delete :shopping_cart
      end

      params.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def add_item (product)
    self.shopping_cart << product
  end

  def add_payment (payment)
    self.payment << payment
  end

  def to_hash
    hash = {
        id:self.id,
        visitor:self.visitor,
        total_amount:self.total_amount,
        shipping_amount:self.shipping_amount,
        tax_amount:self.tax_amount,
        currency:self.currency,
        installments:self.installments,
        ip:self.ip,
        first_message:self.first_message,
        messages_exchanged:self.messages_enchanged,
        purchased_at:self.purchased_at,
        analyze:self.analyze,
        customer:self.customer.to_hash,
        payment: KondutoUtils.array_to_hash(self.payment),
        billing:self.billing_address.to_hash,
        shipping:self.shipping_address.to_hash,
        shopping_cart:KondutoUtils.array_to_hash(self.shopping_cart),
        travel:self.travel.to_hash,
        seller:self.seller.to_hash,
        device:self.device.to_hash,
        geolocation:self.geolocation.to_hash,
        navigation:self.navigation.to_hash
    }
    KondutoUtils.remove_nil_keys_from_hash(hash)
  end

  def to_json
    self.to_hash.to_json
  end

  def to_json
    self.to_hash.to_json
  end

end
