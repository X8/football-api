class Nationality
  include Virtus.value_object

  values do
    attribute :name, String
  end
end
