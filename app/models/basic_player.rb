class BasicPlayer
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :first_name, String
    attribute :last_name, String
  end
end
