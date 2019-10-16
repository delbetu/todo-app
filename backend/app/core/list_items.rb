class ListItems
  class Params < Value.new(:group_id, :user_id, :data_provider)
    def validate!
      Integer(group_id) # must be numeric
      Integer(user_id) # must be numeric
      raise ArgumentError unless data_provider.respond_to?(:for) # collaborator must respond to :for
    end
  end

  Result = Value.new(:items)

  def self.call(params)
    params.validate!
    items = params.data_provider.for(params.group_id, params.user_id)
    Result.with(items: items)
  end
end
