class MasterList < Persistable
  def initialize(redis)
    @redis = redis
    @id = :master_list
    reload!
    super redis, @id
  end

  def new_alias(id)
    @data << id
    persist!
  end

  def remove_alias(id)
    raise ArgumentError.new "Nonexisting maillist" unless @data.delete(id)
    persist!
  end
end
