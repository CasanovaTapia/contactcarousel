class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.references :contact, index: true
      t.string :dial
      t.string :conversation
      t.string :invest
      t.string :timing
      t.string :motivator

      t.timestamps
    end
  end
end
