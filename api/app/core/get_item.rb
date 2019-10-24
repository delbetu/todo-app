require_relative 'dto'

class GetItem
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[ id: C::Num, data_provider: C::RespondTo[:get] ] => Dto::Item)
  def self.call(id:, data_provider:)
    Dto::Item(data_provider.get(id))
  end
end

