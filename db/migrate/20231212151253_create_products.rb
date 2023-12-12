class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :barcode
      t.string :description
      t.float :weight
      t.integer :bucket

      t.timestamps
    end
  end
end
