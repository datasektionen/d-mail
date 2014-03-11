require './environment'
STDOUT.sync = true
puts "initializing..."
server = Server.new 25, "130.237.234.173", 4
puts "starting..."
server.start
puts "server started."
server.join
