config = Rails.application.config

config.to_prepare do
  config.data_adapter = FileSystemAdapter.new(Rails.root.join("db/data"))
end
