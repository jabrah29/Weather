module MessageBuilder

  BASE_MESSAGE = "Good Morning. This is today's weather".freeze

  def generate_daily_message(params)
    "#{BASE_MESSAGE} \n
     Current Temp: #{params[:current_tempF]} F   #{params[:current_tempC]} C
     Precipitation: #{params[:current_precipitation]}
     Evening Temp: #{params[:future_tempF]} F  #{params[:future_tempC]} C"
  end


end