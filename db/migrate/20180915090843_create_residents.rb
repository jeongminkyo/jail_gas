class CreateResidents < ActiveRecord::Migration[5.0]
  def change
    create_table :residents do |t|
      t.string :dong
      t.integer :ho
      t.string :name

      t.timestamps
    end
  end
end
