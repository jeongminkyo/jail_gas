class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.integer :active, default: 1
      t.timestamps
    end
  end
end
