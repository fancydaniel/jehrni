class AddImageUrlToSavedEntries < ActiveRecord::Migration
  def change
    add_column :saved_entries, :image_url, :string
  end
end
