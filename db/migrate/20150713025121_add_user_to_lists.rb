class AddUserToLists < ActiveRecord::Migration
  def change
    add_column :lists, :user_id, :integer, index: true
  end
end
