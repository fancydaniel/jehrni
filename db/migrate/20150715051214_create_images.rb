class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :image_url
      t.integer :item_id
      t.integer :saved_entries_id
    end
    add_index :images, :item_id
    add_index :images, :saved_entries_id
  end
end
