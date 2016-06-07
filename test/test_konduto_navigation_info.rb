require 'minitest/autorun'
require 'factory_girl'

class TestKondutoNavigationInfo < Minitest::Test
  include FactoryGirl::Syntax::Methods

  def test_serialization
    navigation_info = build(:konduto_navigation_info)
    navigation_infoJSON = load_resource('navigation.json')

    assert_equal navigation_info.to_hash, navigation_infoJSON, 'serialization falied'
  end
end
