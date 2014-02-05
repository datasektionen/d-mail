require 'redis'
require 'json'
require 'mini-smtp-server'

Dir["lib/*"].each do |file|
  require_relative("./#{file}") or puts "failed to load #{file}"
end

class StdoutServer < MiniSmtpServer

  def initialize(redis = Redis.new)
    @redis = redis
  end
  def new_message_event(message_hash)
    puts "# New email received:"
    puts "-- passing on to:"
    puts "-- #{get_recipients}"
    puts "--"
    puts "-- " + message_hash[:data].gsub(/\r\n/, "\r\n-- ")
    puts
  end

  private

  def get_recipients
    JSON.parse @redis.get(message_hash[:to])
  end

end
#server = StdoutServer.new 2525, "127.0.0.1", 4

#server.start
#server.join