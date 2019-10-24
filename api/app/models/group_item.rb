class GroupItem < ApplicationRecord
    # expose :id, :list_title
    # expose :list_items, with: Item::Entity
  has_many :list_items, dependent: :destroy, class_name: "Item"
  belongs_to :user

  extend DataProviderPort

  def self.list(options)
    where(options[:filters]).map { |r| Dto::Group.new(r.id, r.list_title) }
  rescue ActiveRecord::StatementInvalid => e
    raise DataProviderPort::InvalidOptions, e.message
  end

  # This overrides active record create which is used for factories in spec.
  def self.create(resource_values)
    new_group = new(resource_values)
    new_group.save!
    new_group.id
  rescue ActiveRecord::RecordInvalid => e
    raise DataProviderPort::ResourceSavingError, e.message
  end

  def self.update(id, attributes_hash)
    group = find(id)
    attributes_hash.each do |attr_name, attr_value|
      group.send("#{attr_name}=", attr_value) unless attr_value.nil?
    end
    group.save!
    nil
  rescue ActiveRecord::RecordNotFound => e
    raise DataProviderPort::ResourceNotFound, e.message
  rescue ActiveRecord::RecordInvalid => e
    raise DataProviderPort::ResourceSavingError, e.message
  end

  def self.get(id)
    group = find(id)
    ::Dto::Group.new(group.id, group.list_title)
  rescue ActiveRecord::RecordNotFound => e
    raise DataProviderPort::ResourceNotFound, e.message
  end

  def self.destroy(id)
    group = find(id)
    group.destroy
    nil
  rescue ActiveRecord::RecordNotFound => e
    raise DataProviderPort::ResourceNotFound, e.message
  end
end
