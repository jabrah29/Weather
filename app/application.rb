require_relative '../app/api/twilio_handler'
require_relative 'scrapper/page_scraper'
require "byebug"
require 'benchmark'
require 'bigdecimal/math'

class Application
  def run
    twilio_handler = TwilioHandler.new
   # twilio_handler.authenticate
    scrapper = PageScraper.new
    table = scrapper.get_hourly_table
    
    message_builder = MessageBuilder.new
    byebug
    message = message_builder.generate_daily_message(message_params(table.first[1]))
    twilio_handler.authenticate(TwilioHandler.run_as_dev)
    twilio_handler.initiate_instance
    status =twilio_handler.send_message('6475687414',message.to_s)
  end

  def message_params(hour)
    return {
        :hour => hour.hour,
        :temp_in_f => hour.temperature,
        :temp_in_c => hour.to_celcius(hour.temperature),
        :description => hour.description,
        :precipitation => hour.precipitation
    }
  end
end

app = Application.new
app.run