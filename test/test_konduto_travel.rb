require 'minitest/autorun'
require 'factory_girl'

class KondutoTravelTest < MiniTest::Test
  include FactoryGirl::Syntax::Methods

  def test_validation
    travel = KondutoTravel.new
    assert_equal false, travel.valid?, 'should be invalid without a type'

    travel.type = :flight
    assert_equal false, travel.valid?, 'should be invalid without departure leg'

    travel.departure = build(:konduto_flight_leg)
    assert_equal false, travel.valid?, 'should be invalid without passengers'

    travel.passengers = build_list(:konduto_passenger, 2)
    assert_equal true, travel.valid?, 'should be valid without a return leg'

    travel.return = build(:konduto_flight_leg)
    assert travel.valid?, 'should continue value'
  end
end
