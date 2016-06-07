require 'minitest/autorun'
require 'factory_girl'

class TestKondutoSeller < Minitest::Test
  include FactoryGirl::Syntax::Methods
  
  def test_serialization
    seller = build(:konduto_seller)
    sellerJSON = load_resource('seller.json')

    assert_equal sellerJSON, seller.to_hash, 'serialization failed'
  end
end
