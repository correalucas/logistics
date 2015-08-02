require 'test_helper'

class LogisticMeshesControllerTest < ActionController::TestCase
  setup do
    @logistic_mesh = logistic_meshes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logistic_meshes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logistic_mesh" do
    assert_difference('LogisticMesh.count') do
      post :create, logistic_mesh: { destination: @logistic_mesh.destination, distance: @logistic_mesh.distance, origin: @logistic_mesh.origin }
    end

    assert_redirected_to logistic_mesh_path(assigns(:logistic_mesh))
  end

  test "should show logistic_mesh" do
    get :show, id: @logistic_mesh
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logistic_mesh
    assert_response :success
  end

  test "should update logistic_mesh" do
    patch :update, id: @logistic_mesh, logistic_mesh: { destination: @logistic_mesh.destination, distance: @logistic_mesh.distance, origin: @logistic_mesh.origin }
    assert_redirected_to logistic_mesh_path(assigns(:logistic_mesh))
  end

  test "should destroy logistic_mesh" do
    assert_difference('LogisticMesh.count', -1) do
      delete :destroy, id: @logistic_mesh
    end

    assert_redirected_to logistic_meshes_path
  end
end
