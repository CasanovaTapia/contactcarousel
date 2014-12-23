class AddUserToCall < ActiveRecord::Migration
  def change
    add_column :calls, :user_id, :integer
    add_index :calls, :user_id
  end
end
