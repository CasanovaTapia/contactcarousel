class CreateDials < ActiveRecord::Migration
  def change
    create_table :dials do |t|
      t.string :result

      t.timestamps
    end
  end
end
