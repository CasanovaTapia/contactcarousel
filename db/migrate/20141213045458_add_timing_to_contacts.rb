class AddTimingToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :timing_id, :integer
    add_index :contacts, :timing_id
  end
end
