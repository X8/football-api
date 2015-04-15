require File.expand_path('../../config/environment', __FILE__)

LEAGUE_ID = 39
MATCH_ID  = ARGV[0]

Rails.logger = Logger.new(STDOUT)

if MATCH_ID.blank?
  abort "Usage: #{$0} match_id"
end

replay = ReplayService.new(Pusher, LEAGUE_ID, MATCH_ID.to_i)

Rails.logger.info("Sending to pusher...")
Rails.logger.info("APP ID: #{Pusher.app_id}")
Rails.logger.info("Channel: #{replay.channel}")

replay.start
