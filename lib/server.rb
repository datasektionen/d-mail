class Server < MiniSmtpServer
  def initialize(*args)
    @storage = ListStorage.new
    @queue = MailQueue.new
    @logger = Logger.new("./logs/received_mail.log")
    super
  end

  attr_writer :storage, :queue

  def new_message_event(message_hash)
    @logger.info "Message to:#{message_hash[:to]} received"
    @logger.info "sent to: #{@storage.get(message_hash[:to]).join(' ')}"
    puts "# New Email received"
    puts "-- to: #{message_hash[:to]}"
    puts "-- recipients:"
    if recipients = @storage.get(message_hash[:to])
      recipients.each do |adress|
        puts "--> #{adress}"
      end
    else
      puts "none"
    end
    puts
  end
end