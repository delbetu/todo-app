class CreateGroup
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[list_title: String, user_id: C::Num,
                          data_provider: C::RespondTo[:create] ] => C::Num)
  def self.call(user_id:, list_title:, data_provider:)
    data_provider.create(user_id: user_id, list_title: list_title)
  end
end
