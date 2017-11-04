require 'nokogiri'
require 'HTTParty'

class PageScraper
  WEATHER_COM_URL = "https://weather.com/weather/hourbyhour/l/CAXX0504:1:CA"

  def html_page
    HTTParty.get(WEATHER_COM_URL)
  end
  def create_nokogiri_instance(page)
    @nokogiri_parser = Nokogiri::HTML(page)
  end


end