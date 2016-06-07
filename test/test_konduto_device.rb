
require 'minitest/autorun'
require 'factory_girl'

class KondutoDeviceTest < MiniTest::Test
  include FactoryGirl::Syntax::Methods

  def test_serialization
    device = build(:konduto_device)
    deviceJSON = load_resource('device.json')

    assert_equal device.to_hash, deviceJSON, 'serialization failed'

    device = KondutoDevice.new deviceJSON
    assert_equal device.to_hash, deviceJSON, 'deserialization failed'
  end
end
