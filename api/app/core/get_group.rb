class GetGroup
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[id: C::Num, data_provider: C::RespondTo[:get]] => Dto::Group )
  def self.call(id:, data_provider:)
    group = data_provider.get(id)
    Dto::Group(group)
  end
end
