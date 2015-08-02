class Cost
  attr_accessor :autonomy, :gas_price, :distance
  
  def initialize
    yield self if block_given?
  end

  def calculate
    return (@gas_price * @distance) / @autonomy
  end

end
