class Item < ApplicationRecord
  # expose :id, :title, :completed
  belongs_to :group_item
end
