class Item < ActiveRecord::Base
  belongs_to :group_item

  def entity
    Entity.new(self)
  end

  class Entity < Grape::Entity
    expose :id, :title, :completed
  end
end
