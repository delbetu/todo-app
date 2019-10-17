class Item < ApplicationRecord
  # expose :id, :title, :completed
  belongs_to :group_item

  def self.for(user_id, group_id)
    joins(:group_item).where(group_item_id: group_id, group_items: { user_id: user_id })
  end
end
