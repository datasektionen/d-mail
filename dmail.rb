require './environment'
STDOUT.sync = true
puts "initializing..."

if ARGV[0] == "production"
  config = Miniconfig.load 'config/app.yml'
  server = Server.new config.server.port, config.server.ip, config.server.count
  redis = Redis.new path: config.redis.path
  redis.select config.list_index
  server.set_storage(ListStorage.new(redis))
  redis = Redis.new path: config.redis.path
  redis.select config.queue_index
  server.set_queue(MailQueue.new(redis))
else
  server = Server.new 2525, "127.0.0.1", 4
end
puts "starting..."
server.start
puts "server started."
server.join
