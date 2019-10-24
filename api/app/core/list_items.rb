require_relative 'dto'

class ListItems
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[ group_id: C::Num, user_id: C::Num, data_provider: C::Any ] => C::ArrayOf[::Dto::Item])
  def self.call(group_id:, user_id:, data_provider:)
    filters = { group_item_id: group_id, group_items: { user_id: user_id } }
    data_provider.list(filters: filters)
  end
end
