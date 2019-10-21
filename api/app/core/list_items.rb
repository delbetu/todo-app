require_relative 'dto'

class ListItems
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[ group_id: C::Num, user_id: C::Num, data_provider: C::Any ] => C::ArrayOf[::Dto::Item])
  def self.call(group_id:, user_id:, data_provider:)
    data_provider.for(group_id: group_id, user_id: user_id).map { |r| Dto::Item.new(r.id, r.title, r.completed) }
  end
end
