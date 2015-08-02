class Map < ActiveRecord::Base
  validates_presence_of :name, :origin, :destination
  validates_numericality_of :autonomy, :gas_price
end
