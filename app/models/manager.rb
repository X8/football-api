class Manager
  include Virtus.value_object

  values do
    attribute :first_name, String
    attribute :last_name, String
  end
end
