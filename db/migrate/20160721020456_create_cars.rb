class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
