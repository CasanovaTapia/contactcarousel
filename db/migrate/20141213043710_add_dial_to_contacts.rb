class AddDialToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :dial_id, :integer
    add_index :contacts, :dial_id
  end
end
