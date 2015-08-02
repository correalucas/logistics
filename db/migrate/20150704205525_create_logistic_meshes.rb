class CreateLogisticMeshes < ActiveRecord::Migration
  def change
    create_table :logistic_meshes do |t|
      t.string :origin
      t.string :destination
      t.decimal :distance, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
