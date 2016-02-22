class AddUserToGroupItem < ActiveRecord::Migration
  def change
    add_reference :group_items, :user, index: true, foreign_key: true
  end
end
