class AddMotivatorToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :motivator_id, :integer
    add_index :contacts, :motivator_id
  end
end
