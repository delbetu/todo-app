class Item < ActiveRecord::Base
  def entity
    Entity.new(self)
  end

  class Entity < Grape::Entity
    expose :id, :title, :completed
  end
end
