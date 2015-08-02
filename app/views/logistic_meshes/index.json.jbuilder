json.array!(@logistic_meshes) do |logistic_mesh|
  json.extract! logistic_mesh, :id, :origin, :destination, :distance
  json.url logistic_mesh_url(logistic_mesh, format: :json)
end
