class AddGroupItemToItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :group_item, index: true, foreign_key: true
  end
end
