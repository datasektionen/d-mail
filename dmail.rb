require './environment'
STDOUT.sync = true
puts "initializing..."

if ARGV[0] == "production"
  config = MiniConfig.load 'config/app.yml'
  server = Server.new config.server.port, config.server.ip, config.server.count
  server.set_storage(ListStorage.new(Redis.new config.redis.path))
else
  server = Server.new 2525, "127.0.0.1", 4
end
puts "starting..."
server.start
puts "server started."
server.join
