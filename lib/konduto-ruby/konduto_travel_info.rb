class KondutoTravelInfo < KondutoBase
  attributes :number_of_connections, :class, :fare_basis
  attribute date: :date

  TRAVEL_CLASS = [:economy, :business, :first]
end
