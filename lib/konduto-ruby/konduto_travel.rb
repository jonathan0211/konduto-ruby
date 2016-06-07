class KondutoTravel < KondutoBase
  has_one :flight_leg, alias: :departure
  has_one :flight_leg, alias: :return
  has_many :passenger, alias: :passengers

  attribute type: :symbol

  validates_presence_of :type, :departure, :passengers
end
