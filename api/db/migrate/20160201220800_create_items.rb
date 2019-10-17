class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
