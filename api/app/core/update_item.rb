require_relative 'validation'

class UpdateItem
  extend Validation

  C = Contracts
  include C::Core
  DataIntegrityViolation = Class.new(StandardError)

  Contract(C::KeywordArgs[user: C::RespondTo[:has_group?], group_id: C::Num, item_id: C::Num,
                          title: C::Maybe[String], completed: C::Maybe[C::Bool],
                          data_provider: C::RespondTo[:update] ] => C::Bool)
  def self.call(user:, group_id:, item_id:, title:, completed:, data_provider:)
    check_user_group_referential_integrity(user, group_id, action: 'update')
    non_nil_attributes = { title: title, completed: completed }.reject { |_, v| v.nil? }
    data_provider.update(non_nil_attributes.merge(id: item_id))
  end
end
