class AddDefaultItemValue < ActiveRecord::Migration
  def change
    change_column :items, :completed, :boolean, null: false, default: false
  end
end
