class MailAlias < Persistable
  def initialize(redis, id)
    @redis = redis
    @id = id
    reload_or_register
  end

  private

  def reload_or_register
    master = MasterList.new(@redis)
    if master.alias_exists? @id
      reload!
    else
      MasterList.new(redis).new_alias @id
    end
  end
end