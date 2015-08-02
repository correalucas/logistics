json.array!(@maps) do |map|
  json.extract! map, :id, :name, :origin, :destination, :autonomy, :gas_price
  json.url map_url(map, format: :json)
end
