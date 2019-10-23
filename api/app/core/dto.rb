# Data transfer objects
module Dto
  Item = Struct.new(:id, :title, :completed)
  class NullItem < Item
    def id; end
    def title; end
    def completed; end
    def nil?; true; end
  end

  Group = Value.new(:id, :list_title)
  class NullGroup < Group
    def id; nil; end
    def list_title; nil; end
    def nil?; true; end
  end

  ############################## DTO FACTORIES ##############################
  def self.Item(object)
    return Dto::NullItem.new if object.nil?
    Dto::Item.new(object.id, object.title, object.completed)
  end

  def self.Group(object)
    return Dto::NullGroup.new if object.nil?
    Dto::Group.new(object.id, object.list_title)
  end
end
