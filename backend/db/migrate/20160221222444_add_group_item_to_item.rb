class AddGroupItemToItem < ActiveRecord::Migration
  def change
    add_reference :items, :group_item, index: true, foreign_key: true
  end
end
