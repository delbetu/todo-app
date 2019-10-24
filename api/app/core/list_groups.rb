class ListGroups
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[user_id: C::Num, data_provider: C::RespondTo[:list]] => C::ArrayOf[Dto::Group] )
  def self.call(user_id:, data_provider:)
    data_provider.list(filters: { user_id: user_id })
  end
end

