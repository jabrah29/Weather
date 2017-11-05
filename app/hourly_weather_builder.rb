require_relative 'hourly_weather'
class HourlyWeatherBuilder

  def initialize
    @hourly_weather = HourlyWeather.new
  end

  def temperature(temp)
    @hourly_weather.temperature = temp
    self
  end

  def description(description)
    @hourly_weather.description = description
    self
  end

  def hour(time)
    @hourly_weather.hour = time
    self
  end

  def precipitation(precipitation)
    @hourly_weather.precipitation = precipitation
    self
  end

  def hourly_weather
    @hourly_weather
  end

end