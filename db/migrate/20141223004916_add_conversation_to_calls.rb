class AddConversationToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :conversation_id, :integer
    add_index :calls, :conversation_id
  end
end
