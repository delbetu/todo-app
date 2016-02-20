class GroupItem < ActiveRecord::Base
  def entity
    Entity.new(self)
  end

  class Entity < Grape::Entity
    expose :id, :list_title
  end
end
