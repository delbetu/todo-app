class CreateGroup
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[list_title: String, user_id: C::Num,
                          data_provider: C::RespondTo[:create] ] => Dto::Group)
  def self.call(user_id:, list_title:, data_provider:)
    result = data_provider.create(user_id: user_id, list_title: list_title)
    Dto::Group(result)
  end
end
