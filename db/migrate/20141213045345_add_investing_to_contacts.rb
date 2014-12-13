class AddInvestingToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :investing_id, :integer
    add_index :contacts, :investing_id
  end
end
