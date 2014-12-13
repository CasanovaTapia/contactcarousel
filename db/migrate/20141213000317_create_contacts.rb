class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :entity
      t.string :phone
      t.string :alt_phone
      t.string :dead_phone
      t.string :email
      t.string :alt_email
      t.string :dead_email

      t.timestamps
    end
  end
end
