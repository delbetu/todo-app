class GroupItem < ApplicationRecord
    # expose :id, :list_title
    # expose :list_items, with: Item::Entity
  has_many :list_items, dependent: :destroy, class_name: "Item"
  belongs_to :user

  def self.for(user_id:)
    where(user_id: user_id)
  end

  # returns true/false
  def self.update(id:, list_title:)
    item = find_by(id: id)
    return false unless item
    item.list_title = list_title if list_title.present?
    item.save
  end

  # returns true when success
  def self.destroy(id:)
    item = find_by(id: id)
    return false unless item
    item.destroy
    item.destroyed?
  end
end
