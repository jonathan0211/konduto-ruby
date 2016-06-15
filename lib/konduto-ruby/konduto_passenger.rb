class KondutoPassenger < KondutoBase
  attributes :name, :document, :nationality, :frequent_traveler, :special_needs, \
             :loyalty, :loyalty_program, :loyalty_category
  attribute dob: :date
  attribute document_type: :symbol

  validates_presence_of :name, :document, :document_type, :nationality

  validates(:nationality) do |attr|
    attr.match(/[a-zA-Z]{2}/)
  end
end
