class TouchEvent
  include Virtus.value_object

  values do
    attribute :sequence, Integer
    attribute :touch_type_id, Integer
    attribute :name, String
    attribute :player, BasicPlayer
    attribute :recipient_player, BasicPlayer
    attribute :time, PointInGame
    attribute :coordinates, Coordinate
    attribute :coordinates_end, Coordinate
  end
end
