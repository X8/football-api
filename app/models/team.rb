class Team
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :type, String
    attribute :score, Integer
    attribute :name, String
    attribute :abbreviation, String
    attribute :location, String
  end
end
