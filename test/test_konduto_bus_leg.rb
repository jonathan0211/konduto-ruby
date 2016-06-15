require 'minitest/autorun'
require 'date'

class TestKondutoBugLeg < Minitest::Test
  def setup
    @params = {
      origin_city: 'São Paulo',
      destination_city: 'Rio de Janeiro',
      date: Date.new(2015, 5, 7),
      number_of_connections: 0
    }
  end

  def test_validation
    bus_leg = KondutoBusLeg.new
    assert_equal false, bus_leg.valid?
    bus_leg.origin_city = 'São Paulo'
    assert_equal false, bus_leg.valid?
    bus_leg.destination_city = 'Rio de Janeiro'
    assert bus_leg.valid?
  end

  def test_serialization
    bus_leg = KondutoBusLeg.new(@params)
    assert_equal @params.to_json, bus_leg.to_json
  end
end
