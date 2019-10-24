class Item < ApplicationRecord
  # expose :id, :title, :completed
  belongs_to :group_item
  extend DataProviderPort

  def self.list(options)
    # options[:filters] => { group_item_id: 1, group_items: { user_id: 4 } }
    joins(:group_item).where(options[:filters])
      .map { |r| Dto::Item.new(r.id, r.title, r.completed) }
  rescue ActiveRecord::StatementInvalid => e
    raise DataProviderPort::InvalidOptions, e.message
  end

  def self.create(resource_values)
    new_item = new(resource_values)
    new_item.save!
    new_item.id
  rescue ActiveRecord::RecordInvalid => e
    raise DataProviderPort::ResourceSavingError, e.message
  end

  def self.update(id, attributes_hash)
    item = find(id)
    attributes_hash.each do |attr_name, attr_value|
      item.send("#{attr_name}=", attr_value) unless attr_value.nil?
    end
    item.save!
    nil
  rescue ActiveRecord::RecordNotFound => e
    raise DataProviderPort::ResourceNotFound, e.message
  rescue ActiveRecord::RecordInvalid => e
    raise DataProviderPort::ResourceSavingError, e.message
  end

  def self.get(id)
    item = find(id)
    ::Dto::Item.new(item.id, item.title, item.completed)
  rescue ActiveRecord::RecordNotFound => e
    raise DataProviderPort::ResourceNotFound, e.message
  end

  def self.destroy(id)
    item = find(id)
    item.destroy
    nil
  rescue ActiveRecord::RecordNotFound => e
    raise DataProviderPort::ResourceNotFound, e.message
  end
end
