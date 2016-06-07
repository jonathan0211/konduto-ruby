require 'minitest/autorun'
require 'factory_girl'

class TestKondutoPassenger < Minitest::Test
  include FactoryGirl::Syntax::Methods

  def test_validation
    passenger = KondutoPassenger.new
    assert_equal false, passenger.valid?, 'should be invalid without name'

    passenger.name = 'Milton Tavares'
    assert_equal false, passenger.valid?, 'should be invalid without document'

    passenger.document = 'A1B2C3D4'
    assert_equal false, passenger.valid?, 'should be invalid without document type'

    passenger.document_type = :passport
    assert_equal false, passenger.valid?, 'should be invalid without nationality'

    passenger.nationality = '123'
    assert_equal false, passenger.valid?, 'should be invalid if not a 2 chars string'
    passenger.nationality = 'BR'
    assert_equal true, passenger.valid?, 'should be a valid passenger'
  end

  def test_serialization
    passengerJSON = load_resource('passenger.json')
    passenger = build(:konduto_passenger, :fixed_complete)

    assert_equal passengerJSON, passenger.to_hash, 'serialization failed'
  end
end
