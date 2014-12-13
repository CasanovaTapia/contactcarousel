class CreateTimings < ActiveRecord::Migration
  def change
    create_table :timings do |t|
      t.string :result

      t.timestamps
    end
  end
end
