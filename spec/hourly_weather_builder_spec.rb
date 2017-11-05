require_relative '../app/hourly_weather_builder'
require_relative '../app/hourly_weather'

describe HourlyWeatherBuilder do

  before :all do
    @weather_builder = HourlyWeatherBuilder.new
  end

  describe '#temperature' do
    it 'creates hourly weather object and sets temp' do
      @weather_builder.temperature("TEMP")
      expect(@weather_builder.hourly_weather.temperature).to eq("TEMP")
    end
  end

  describe '#description' do
    it 'creates hourly weather object and sets description' do
      @weather_builder.description("DESCRIPTION")
      expect(@weather_builder.hourly_weather.description).to eq("DESCRIPTION")
    end
  end

  describe '#precipitation' do
    it 'creates hourly weather object and sets precipitation' do
      @weather_builder.precipitation("PRECIPITATION")
      expect(@weather_builder.hourly_weather.precipitation).to eq("PRECIPITATION")
    end
  end

end