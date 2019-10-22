class CreateItem
  C = Contracts
  include C::Core
  DataIntegrityViolation = Class.new(StandardError)

  Contract(C::KeywordArgs[group_id: C::Num, title: String, user: C::RespondTo[:has_group?],
                          data_provider: C::RespondTo[:create] ] => ::Dto::Item)
  def self.call(group_id: group_id, title: title, user: user, data_provider: )
    check_that_group_id_belongs_to_current_user(user, group_id)
    create_item(group_id, title, data_provider)
  end

  def self.create_item(group_id, title, data_provider)
    item = data_provider.create(group_item_id: group_id, title: title)
    ::Dto::Item(item)
  end

  def self.check_that_group_id_belongs_to_current_user(user, group_id)
    raise DataIntegrityViolation, 'Not allowed to create Item' unless user.has_group?(group_id)
  end
end
