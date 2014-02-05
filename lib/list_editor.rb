class ListEditor
  def initialize(list_storage = ListStorage.new)
    @lists = list_storage
  end

  def add_member_to_list(list_name, member_email)
    if current_list = @lists.get(list_name)
      current_list << member_email
      @lists.set list_name, current_list
    else
      @lists.set list_name, member_email
    end
  end

  def remove_member_from_list(list_name, member_email)
    current_list = @lists.get(list_name) or raise ArgumentError.new "list does not exist."
    current_list.delete member_email or raise ArgumentError.new "That email is not a member of that list."
    @lists.set list_name, current_list
  end
end