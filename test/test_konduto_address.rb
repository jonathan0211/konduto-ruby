require 'minitest/autorun'
require 'factory_girl'

class KondutoAddressTest < MiniTest::Test
  include FactoryGirl::Syntax::Methods

  def test_serialization
    address = build(:konduto_address)

    expectedJSON = load_resource('address.json')
    actualJSON   = address.to_hash
    
    assert_equal expectedJSON, actualJSON, 'address serialization failed'

    address_from_json = KondutoAddress.new expectedJSON

    assert_equal address, address_from_json, 'address deserialization failed'
  end
end
