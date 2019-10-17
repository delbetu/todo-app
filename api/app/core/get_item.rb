class GetItem
  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[ id: C::Num, data_provider: C::Any ] => Dto::Item)
  def self.call(id:, data_provider:)
    item = data_provider.find_by(id: id)
    Item(item)
  end

  def self.Item(object)
    return Dto::NullItem.new if object.nil?
    Dto::Item.new(object.id, object.title, object.completed)
  end
end

