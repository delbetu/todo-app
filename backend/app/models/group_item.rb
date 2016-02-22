class GroupItem < ActiveRecord::Base
  has_many :list_items, dependent: :destroy, class_name: "Item"

  def entity
    Entity.new(self)
  end

  class Entity < Grape::Entity
    expose :id, :list_title
    expose :list_items, with: Item::Entity
  end
end
