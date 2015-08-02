require 'test_helper'

class LogisticMeshTest < ActiveSupport::TestCase
  test "should not save mesh without origin and destination" do
    mesh = LogisticMesh.new
    assert_not mesh.save
  end

  test "should not save distance as string" do
    mesh = LogisticMesh.new({origin: 'A', destination: 'B', distance: 'C'})
    assert_not mesh.save
  end

  test "mesh should be unique" do
    mesh1 = LogisticMesh.new({origin: 'A', destination: 'B', distance: 9.9})
    mesh1.save
    mesh2 = LogisticMesh.new({origin: mesh1.origin, destination: mesh1.destination, distance: mesh1.distance})
    assert_not mesh.save
  end
end
