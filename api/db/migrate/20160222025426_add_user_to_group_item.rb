class AddUserToGroupItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_items, :user, index: true, foreign_key: true
  end
end
