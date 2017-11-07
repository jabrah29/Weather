class HourlyWeather

  attr_accessor :hour, :temperature, :precipitation, :description
  def initialize
  end

  def to_celcius(temp)
    (((temp.to_i) -32)/1.8).ceil
  end
end