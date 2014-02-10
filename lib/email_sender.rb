class EmailSender

  def initialize(redis = Redis.new)
    @redis = redis
    super
  end

  def send(email_hash)
  end
end