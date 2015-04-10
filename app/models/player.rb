class Player
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :first_name, String
    attribute :last_name, String
    attribute :position, String
    attribute :height, Integer
    attribute :weight, Integer
    attribute :birthdate, Birthdate
    attribute :birthplace, Birthplace
    attribute :nationality, Nationality

  end
end
