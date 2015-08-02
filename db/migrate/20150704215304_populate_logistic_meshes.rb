class PopulateLogisticMeshes < ActiveRecord::Migration
  def up
    LogisticMesh.create({origin: 'A', destination: 'B', distance: 10})
    LogisticMesh.create({origin: 'B', destination: 'D', distance: 15})
    LogisticMesh.create({origin: 'A', destination: 'C', distance: 20})
    LogisticMesh.create({origin: 'C', destination: 'D', distance: 30})
    LogisticMesh.create({origin: 'B', destination: 'E', distance: 50})
    LogisticMesh.create({origin: 'D', destination: 'E', distance: 30})
  end

  def down
    LogisticMesh.delete_all
  end
end
