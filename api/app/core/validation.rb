module Validation
  DataIntegrityViolation = Class.new(StandardError)

  def check_user_group_referential_integrity(user, group_id, action:)
    raise DataIntegrityViolation, "Not allowed to #{action} Item" unless user.has_group?(group_id)
  end
end
