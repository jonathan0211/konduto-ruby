class KondutoTravelLeg < KondutoBase
  attributes :number_of_connections, :fare_basis
  attribute date: :date
  attribute klass: :symbol
end
