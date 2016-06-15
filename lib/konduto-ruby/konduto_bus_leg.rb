class KondutoBusLeg < KondutoTravelLeg
  attributes :origin_city, :destination_city
  validates_presence_of :origin_city, :destination_city
end
