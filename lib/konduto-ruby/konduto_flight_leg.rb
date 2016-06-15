class KondutoFlightLeg < KondutoTravelLeg
  attributes :origin_airport, :origin_city, :destination_airport, :destination_city
  validates_presence_of :origin_airport, :destination_airport

  validates(:origin_airport, :destination_airport) do |attr|
    attr.match(/[a-zA-Z]{3}/)
  end
end
