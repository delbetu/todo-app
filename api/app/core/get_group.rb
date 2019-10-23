class GetGroup
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[id: C::Num, data_provider: C::RespondTo[:find_by]] => Dto::Group )
  def self.call(id:, data_provider:)
    group = data_provider.find_by(id: id)
    Dto::Group(group)
  end
end
