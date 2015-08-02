class Possibilities
  attr_accessor :origin, :destination
  def initialize
    yield self if block_given?
  end

  def check
    return "origin not found" unless LogisticMesh.where(origin: @origin).any?
    return "destination not found" unless LogisticMesh.where(destination: @destination).any?
    ways    = Hash.new {|hash, key| hash[key] = {route: [], quilometers: 0}}
    LogisticMesh.where(origin: @origin).each do |route|
      data               = ways[route.id]
      data[:route]       << route.origin
      data[:route]       << route.destination
      data[:quilometers] += route.distance
      while data[:route].last != @destination
        point = LogisticMesh.where(origin: data[:route].last).where(destination: @destination)
        if point.any?
          point = point.first
          data[:route] << point.destination
          data[:quilometers] += point.distance   
        else
          point = LogisticMesh.where(origin: data[:route].last)
          if point.any?
            point = point.first
            data[:route] << point.destination
            data[:quilometers] += point.distance   
          else
            ways.delete(route.id)
            break
          end
        end
        last_items = data[:route].last(2)
        break if last_items[0].eql?(last_items[1])
      end
    end
    ways = ways.sort_by{|k, v| v[:quilometers]}
    return ways.any? ? ways[0][1] : "route not found"
  end
end