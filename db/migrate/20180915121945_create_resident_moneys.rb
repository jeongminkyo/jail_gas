class CreateResidentMoneys < ActiveRecord::Migration[5.0]
  def change
    create_table :resident_moneys do |t|
      t.integer :year
      t.integer :month
      t.integer :money
      t.integer :resident_id
      t.string :date

      t.timestamps
    end
  end
end
