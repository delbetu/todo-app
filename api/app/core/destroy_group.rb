class DestroyGroup
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[id: C::Num, data_provider: C::RespondTo[:destroy]] => C::Bool)
  def self.call(id:, data_provider:)
    data_provider.destroy(id: id)
  end
end
