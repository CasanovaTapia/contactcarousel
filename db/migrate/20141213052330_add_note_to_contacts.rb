class AddNoteToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :body, :text
  end
end
