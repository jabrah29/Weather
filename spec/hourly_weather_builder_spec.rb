require_relative '../app/hourly_weather_builder'
require_relative '../app/hourly_weather'

describe HourlyWeatherBuilder do

  TEMP = 'TEMP'
  DESCRIPTION = 'DESCRIPTION'
  PRECIPITATION = 'PRECIPITATION'
  HOUR = '11:00'

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

  describe '#hour' do
    it 'creates hourly weather object and sets the current hour' do
      @weather_builder.hour("11:00")
      expect(@weather_builder.hourly_weather.hour).to eq("11:00")
    end
  end

  describe '#hourly_weather' do
    it 'correctly creates hourly weather object with given values' do
      temp_obj = @weather_builder.hour(HOUR)
          .precipitation(PRECIPITATION)
          .description(DESCRIPTION)
          .temperature(TEMP)
          .hourly_weather
      expect(temp_obj).to have_attributes(:temperature => TEMP,
                                          :precipitation => PRECIPITATION,
                                          :description => DESCRIPTION,
                                          :hour => HOUR
                          )
    end
  end

end