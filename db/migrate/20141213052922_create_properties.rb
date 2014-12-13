class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :street_no
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :year_built
      t.integer :units
      t.integer :purchase_year
      t.references :contact, index: true

      t.timestamps
    end
  end
end
