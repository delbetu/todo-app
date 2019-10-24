require_relative 'validation'

class DestroyItem
  extend Validation

  C = Contracts
  include C::Core

  Contract(C::KeywordArgs[id: C::Num, group_id: C::Num, user: C::RespondTo[:has_group?],
                          data_provider: C::RespondTo[:destroy]] => nil)
  def self.call(id:, group_id:, user:, data_provider: )
    check_user_group_referential_integrity(user, group_id, action: 'destroy')
    data_provider.destroy(id)
  end
end
