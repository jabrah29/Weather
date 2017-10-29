class WeatherReport

  attr_reader :temperature, :precipitation, :description
  def initialize(params)
    @temperature = params[:temp]
    @precipitation = params[:precipitation]
    @description = params[:description]

  end
end