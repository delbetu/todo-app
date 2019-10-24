class UpdateGroup
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[id: C::Num, list_title: String, data_provider: C::RespondTo[:update]] => nil)
  def self.call(id:, list_title:, data_provider:)
    data_provider.update(id, list_title: list_title)
  end
end
