require_relative 'validation'

class CreateItem
  extend Validation

  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[group_id: C::Num, title: String, user: C::RespondTo[:has_group?],
                          data_provider: C::RespondTo[:create] ] => ::Dto::Item)
  def self.call(group_id:, title:, user:, data_provider: )
    check_user_group_referential_integrity(user, group_id, action: 'create')
    create_item(group_id, title, data_provider)
  end

  def self.create_item(group_id, title, data_provider)
    item = data_provider.create(group_item_id: group_id, title: title)
    ::Dto::Item(item)
  end
end
