class CreateResidents < ActiveRecord::Migration[5.0]
  def change
    create_table :residents do |t|
      t.string :dong
      t.integer :ho
      t.string :name
      t.integer :active, :default => 0

      t.timestamps
    end
  end
end
