class CreateMotivators < ActiveRecord::Migration
  def change
    create_table :motivators do |t|
      t.string :result

      t.timestamps
    end
  end
end
