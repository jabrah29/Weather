require 'nokogiri'
require 'HTTParty'
require 'awesome_print'
require_relative '../hourly_weather_builder'
require_relative '../hourly_weather'

class PageScraper
  WEATHER_COM_URL = "https://weather.com/weather/hourbyhour/l/CAXX0504:1:CA"
  TABLE_SEARCH_QUERY = '.twc-table'
  attr_reader :nokogiri

  def nokogiri
    @nokogiri ||= Nokogiri::HTML(html_page)
  end

  def html_page
    HTTParty.get(WEATHER_COM_URL)
  end

  def get_hourly_table
    @hourly_table ={}
    table = nokogiri.at(TABLE_SEARCH_QUERY)
    index =0
    table.search('tr').drop(1).each do |tr|
      break if index == 3
      val = convert_row_into_hash tr
      hourly_report = new_object_from_hash val
      @hourly_table[val[:time]] = hourly_report
      index+=1
    end
    remove_invalid_chars_from_key
    remove_invalid_chars_from_hours

    @hourly_table
  end

  private

  def convert_row_into_hash(row)
    
   arr= CSV.generate_line(row.children).split(',')
    {
        :time => arr[1].split.first,
        :description => arr[2],
        :temperature => arr[3],
        :precipitation => arr[5]
    }
  end

  def remove_invalid_chars_from_key
    @hourly_table.keys.each{|key| @hourly_table[key.to_s.gsub(/"/, '')]=@hourly_table.delete(key)}
  end

  def remove_invalid_chars_from_hours
    return @hourly_table.each_pair{|_,value| value.hour=value.hour.gsub(/"/, '')}    
  end

  def new_object_from_hash(val)
    HourlyWeatherBuilder.new
        .hour(val[:time])
        .precipitation(val[:precipitation])
        .description(val[:description])
        .temperature(val[:temperature])
        .hourly_weather
  end


end