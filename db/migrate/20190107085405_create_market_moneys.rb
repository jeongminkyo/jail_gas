class CreateMarketMoneys < ActiveRecord::Migration[5.0]
  def change
    create_table :market_moneys do |t|
      t.integer :month
      t.integer :money
      t.integer :market_id
      t.string :date

      t.timestamps
    end
  end
end
