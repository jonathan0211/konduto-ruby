require 'minitest/autorun'
require 'factory_girl'

class TestKondutoItem < Minitest::Test
  include FactoryGirl::Syntax::Methods

  def test_serialization
    item = build(:konduto_item, :green_shirt)
    itemJSON = load_resource('shopping_cart.json').first

    assert_equal item.to_hash, itemJSON, 'serialization failed'
  end
end
