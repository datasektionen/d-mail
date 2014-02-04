#
# A master list of mail aliases, for uniqueness validation. 
#

class MasterList < Persistable
  def initialize(redis)
    @redis = redis
    @id = :master_list
    reload!
    super redis, @id
  end

  def new_alias(id)
    if @data.include? id
      raise ArgumentError.new "existing maillist"
    end
    @data << id
    persist!
  end

  def remove_alias(id)
    raise ArgumentError.new "Nonexisting maillist" unless @data.delete(id)
    persist!
  end

  def alias_exists?(id)
    @data.include? id
  end
end
