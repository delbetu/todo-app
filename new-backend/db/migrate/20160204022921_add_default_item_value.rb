class AddDefaultItemValue < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :completed, :boolean, null: false, default: false
  end
end
