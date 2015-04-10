class Birthdate
  include Virtus.value_object

  values do
    attribute :year, Integer
    attribute :month, Integer
    attribute :date, Integer
  end
end
