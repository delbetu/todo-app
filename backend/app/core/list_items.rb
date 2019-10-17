require 'contracts'

class ListItems
  C = Contracts
  include C::Core

  Item = Struct.new(:id, :title, :completed)

  Contract(C::KeywordArgs[ group_id: C::Num, user_id: C::Num, data_provider: C::Any ] => C::ArrayOf[Item])
  def self.call(group_id:, user_id:, data_provider:)
    data_provider.for(group_id, user_id).map { |r| Item.new(r.id, r.title, r.completed) }
  end
end
