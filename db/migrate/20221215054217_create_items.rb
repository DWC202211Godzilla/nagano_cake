class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price
      t.text :introduction
      t.boolean :is_active

      t.timestamps
    end
  end
end
