class PointInGame
  include Virtus.value_object

  values do
    attribute :half, Integer
    attribute :minutes, Integer
    attribute :seconds, Integer
    attribute :additional_minutes, Integer
  end
end
