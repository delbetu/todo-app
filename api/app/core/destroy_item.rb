class DestroyItem
  C = Contracts
  include C::Core
  DataIntegrityViolation = Class.new(StandardError)

  Contract(C::KeywordArgs[id: C::Num, group_id: C::Num, user: C::RespondTo[:has_group?],
                          data_provider: C::RespondTo[:destroy] ] => C::Bool)
  def self.call(id:, group_id:, user:, data_provider: )
    check_that_group_id_belongs_to_current_user(user, group_id)
    data_provider.destroy(id: id)
  end

  # TODO: DRY this method
  def self.check_that_group_id_belongs_to_current_user(user, group_id)
    raise DataIntegrityViolation, 'Not allowed to destroy Item' unless user.has_group?(group_id)
  end
end
