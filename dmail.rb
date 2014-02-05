require './environment'
puts "initializing..."
server = Server.new 2525, "127.0.0.1", 4
puts "starting..."
server.start
puts "server started."
server.join