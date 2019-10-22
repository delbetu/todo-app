class UpdateItem
  C = Contracts
  include C::Core
  DataIntegrityViolation = Class.new(StandardError)

  Contract(C::KeywordArgs[user: C::RespondTo[:has_group?], group_id: C::Num, item_id: C::Num,
                          title: C::Maybe[String], completed: C::Maybe[C::Bool],
                          data_provider: C::RespondTo[:update] ] => C::Bool)
  def self.call(user:, group_id:, item_id:, title:, completed:, data_provider:)
    check_that_group_id_belongs_to_current_user(user, group_id)
    non_nil_attributes = { title: title, completed: completed }.reject { |_, v| v.nil? }
    data_provider.update(non_nil_attributes.merge(id: item_id))
  end

  def self.check_that_group_id_belongs_to_current_user(user, group_id)
    raise DataIntegrityViolation, 'Not allowed to update Item' unless user.has_group?(group_id)
  end
end
