class Coordinate
  include Virtus.value_object

  values do
    attribute :x, Integer
    attribute :y, Integer
  end
end
