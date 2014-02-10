class Server < MiniSmtpServer
  
  def initialize(*args)
    @lists = ListStorage.new
    @logger = Logger.new("./logs/received_mail.log")
    super
  end

  def set_storage(list_storage)
    @lists = list_storage
  end

  def new_message_event(message_hash)
    @logger.info "Message to:#{message_hash[:to]} received"
    @logger.info "sent to: #{@lists.get(message_hash[:to]).join(' ')}"
    puts "# New Email received"
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