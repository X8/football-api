class Roster
  include Virtus.value_object

  values do
    attribute :team, Team
    attribute :players, Array[Player]
  end
end
