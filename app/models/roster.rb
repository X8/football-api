class Roster
  include Virtus.value_object

  values do
    attribute :team, Team
    attribute :manager, Manager
    attribute :players, Array[Player]
  end
end
