class AddConversationToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :conversation_id, :integer
    add_index :contacts, :conversation_id
  end
end
