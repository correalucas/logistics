class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :origin
      t.string :destination
      t.decimal :autonomy, :precision => 8, :scale => 2
      t.decimal :gas_price, :precision => 8, :scale => 2
      t.string :best_route
      t.decimal :cost, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
