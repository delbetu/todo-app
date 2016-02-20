class CreateGroupItems < ActiveRecord::Migration
  def change
    create_table :group_items do |t|
      t.string :list_title

      t.timestamps null: false
    end
  end
end
