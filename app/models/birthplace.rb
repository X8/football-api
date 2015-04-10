class Birthplace
  include Virtus.value_object

  values do
    attribute :country, String
    attribute :city, String
  end
end
