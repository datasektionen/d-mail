class ListStorage

  def initialize(redis = Redis.new)
    @redis = redis
  end
    
  def exists?(list_name)
    ! @redis.get(list_name).nil?
  end

  def get(list_name)
    if exists? list_name
      JSON.parse @redis.get(list_name)
    else
      nil
    end
  end

  def set(list_name, members)
    @redis.set list_name, members.to_json
  end
end
