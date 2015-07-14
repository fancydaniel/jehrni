class CreateSavedEntries < ActiveRecord::Migration
  def change
    create_table :saved_entries do |t|
      t.string :url
      t.references :list, index: true

      t.timestamps
    end
  end
end
