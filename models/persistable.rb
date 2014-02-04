require 'redis'
require 'json'

class Persistable
  def initialize(redis_store, id)
    @redis = redis_store
    @id = id
  end

  def persist!
    @redis.set @id, self.to_json
  end

  def reload!
    json_string = @redis.get(@id)
    unless json_string.nil?
      self.instance_variable_set :@data, JSON.parse(json_string)
    end
  end

  def to_json
    @data.to_json
  end

  def data
    @data || "[]"
  end

  def data=(data)
    @data = JSON.parse(data.to_json)
  end
end