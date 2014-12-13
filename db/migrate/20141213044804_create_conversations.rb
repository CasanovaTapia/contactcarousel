class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :result

      t.timestamps
    end
  end
end
