require_relative '../app/api/twilio_handler'
require "byebug"

class Application
  def run
    twilio_handler = TwilioHandler.new
    message = twilio_handler.generate_daily_message(
        current_tempF: 50,
        current_tempC: 13,
        current_precipitation: 'rain',
        future_tempF:46,
        future_tempC: 14
    )
    status =twilio_handler.send_message('6475687414',message.to_s)
    puts status.status
  end

end

app = Application.new
app.run