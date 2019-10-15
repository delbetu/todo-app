class GroupItem < ApplicationRecord
    # expose :id, :list_title
    # expose :list_items, with: Item::Entity
  has_many :list_items, dependent: :destroy, class_name: "Item"
  belongs_to :user
end
