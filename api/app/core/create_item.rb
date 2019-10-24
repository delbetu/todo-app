require_relative 'validation'

class CreateItem
  extend Validation

  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[group_id: C::Num, title: String, user: C::RespondTo[:has_group?],
                          data_provider: C::RespondTo[:create] ] => C::Num)
  def self.call(group_id:, title:, user:, data_provider: )
    check_user_group_referential_integrity(user, group_id, action: 'create')
    data_provider.create(group_item_id: group_id, title: title)
  end
end
