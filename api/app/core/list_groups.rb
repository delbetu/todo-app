class ListGroups
  C = Contracts
  include C::Core

  Group = Value.new(:id, :list_title)
  Contract(C::KeywordArgs[user_id: C::Num, data_provider: C::RespondTo[:for]] => C::ArrayOf[Group] )
  def self.call(user_id: user_id, data_provider:)
    data_provider.for(user_id: user_id).map { |g| Group.new(g.id, g.list_title) }
  end
end

