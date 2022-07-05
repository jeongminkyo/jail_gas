class ChangeDataTypeForResidents < ActiveRecord::Migration[5.0]
  def change
    change_table :residents do |t|
      t.change :ho, :string
    end
  end
end
