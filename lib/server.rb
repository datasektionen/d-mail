class Server < MiniSmtpServer
  def initialize(list_storage = ListStorage.new)
    @lists = list_storage
  end

  def new_message_event(message_hash)
    puts "# New Email recieved"
    puts "-- to: #{message_hash[:to]}"
    puts "-- recipients:"
    if recipients = @lists.get(message_hash[:to])
      recipients.each do |adress|
        puts "--> #{adress}"
      end
    else
      puts "none"
    end
    puts
  end
end