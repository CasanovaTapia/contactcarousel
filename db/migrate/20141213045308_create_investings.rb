class CreateInvestings < ActiveRecord::Migration
  def change
    create_table :investings do |t|
      t.string :result

      t.timestamps
    end
  end
end
