class BestWayController < ApplicationController
  soap_service namespace: "levaetraz.com.br"
  soap_action 'trace_route', 
              args:   { map: :string, origin: :string, destination: :string, autonomy: :string, gas: :string }, 
              return: :string

  def trace_route
    begin
      map = Map.new({
        name:      params[:map],
        origin:    params[:origin],
        destination:   params[:destination],
        autonomy:  params[:autonomy].to_f,
        gas_price: params[:gas].to_f
      })
      if map.valid?
        possibilities = Possibilities.new do |possibility| 
          possibility.origin  = params[:origin]
          possibility.destination = params[:destination]
        end 
        best_way = possibilities.check
        if best_way.kind_of?(String)
          result = best_way
          status = 'unprocessable_entity'
        else
          cost = Cost.new do |cost|
            cost.autonomy  = params[:autonomy].to_f
            cost.gas_price = params[:gas].to_f
            cost.distance  = best_way[:quilometers].to_f
          end
          cost           = cost.calculate
          map.best_route = best_way[:route].to_sentence
          map.cost       = cost
          map.save
          result = "Best route: #{map.best_route} with cost: #{map.cost}"
          status = 'ok'
        end
        render soap: result, status: status.to_sym
      else
        render soap: map.errors.to_a.to_sentence, status: :unprocessable_entity  
      end
    rescue => e
      render soap: e, status: :unprocessable_entity
    end
  end 
end