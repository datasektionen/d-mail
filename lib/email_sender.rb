# Sends emails
class EmailSender
  def initialize
    @redis = Redis.new
    super
  end

  attr_writer :redis

  def send(email_hash)
  end
end
