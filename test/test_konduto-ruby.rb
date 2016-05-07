require 'test/unit'
require 'konduto-ruby'

class KondutoRubyTest < Test::Unit::TestCase
  def test_order_url
    assert_equal "https://api.konduto.com/v1/orders/", KondutoRuby.new("T738D516F09CAB3A2C1EE").order_url.to_s
    assert_equal "https://api.konduto.com/v1/orders/1", KondutoRuby.new("T738D516F09CAB3A2C1EE").order_url(1).to_s
  end
end
