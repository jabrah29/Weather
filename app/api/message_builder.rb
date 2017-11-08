class MessageBuilder

  BASE_MESSAGE = "Good Morning. This is today's weather report".freeze

  module WeatherConditions
    RAIN = ['Rain', 'Showers']
    CLOUDY = ['Cloudy', 'Partly Cloudy', 'Mostly Cloudy']
    THUNDER_STORMS = ['Thunderstorms','Scattered Thunderstorms']
    SUNNY = ['Sunny', 'Mostly Sunny', 'Partly Sunny']
  end

  def report_description(description)
    return 'Expect rain 🌧 ☂ ' if raining?(description)
    return 'Sunny!🕶 ☀ ' if sunny?(description)
    return 'Storming ⚡ 🌩 ' if storming?(description)
    return 'Cloudy ☁ 😞 ' if cloudy?(description)
    return 'None'
  end

  def generate_daily_message(params)
    byebug
    x= "#{BASE_MESSAGE} \nhour: #{params[:hour]}\nCurrent Temp: #{params[:temp_in_f]}F   #{params[:temp_in_c]}°C\nDescription: #{report_description(params[:description])}\nPrecipitation: #{params[:precipitation]}"

  end

  private

  def raining?(description)
    return WeatherConditions::RAIN.any? {|cond| description.include? cond }
  end

  def sunny?(description)
    return WeatherConditions::SUNNY.any? {|cond| description.include? cond}
  end

  def storming?(description)
    return WeatherConditions::THUNDER_STORMS.any? {|cond| description.include? cond}
  end

  def cloudy?(description)
    return WeatherConditions::CLOUDY.any? {|cond| description.include? cond}
  end




end