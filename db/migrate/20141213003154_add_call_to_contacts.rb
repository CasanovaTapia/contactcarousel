class AddCallToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :call_id, :integer
    add_index :contacts, :call_id
  end
end
