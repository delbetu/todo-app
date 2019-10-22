require_relative 'dto'

class GetItem
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[ id: C::Num, data_provider: C::RespondTo[:find_by] ] => Dto::Item)
  def self.call(id:, data_provider:)
    item = data_provider.find_by(id: id)
    ::Dto::Item(item)
  end
end

