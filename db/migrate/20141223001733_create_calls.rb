class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.references :contact, index: true

      t.timestamps
    end
  end
end
