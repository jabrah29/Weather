require_relative '../app/api/twilio_handler'
require "byebug"

describe TwilioHandler do

  TO_PHONE_NUMBER="6475687414"
  def twilio
    @twilio||= TwilioHandler.new
  end
  describe "creates twilio instance" do
    it "correctly authenticates instance" do

      expect(twilio).not_to be_nil

    end
  end

  describe "send_test message" do
    it "sets the client status as 'queued'" do
      result = twilio.send_test_message(TO_PHONE_NUMBER,'TEST MESSAGE')

      expect(result.status.to_s).to eql('queued')
    end
  end
end
