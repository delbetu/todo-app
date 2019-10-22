class Item < ApplicationRecord
  # expose :id, :title, :completed
  belongs_to :group_item

  def self.for(user_id: user_id, group_id: group_id)
    joins(:group_item).where(group_item_id: group_id, group_items: { user_id: user_id })
  end

  def self.update(id:, title:, completed:)
    item = find_by(id: id)
    return false unless item
    item.title = title if title.present?
    item.completed = completed if completed.present?
    item.save
  end
end
