require_relative '../app/api/twilio_handler'
require "byebug"

describe TwilioHandler do

  TO_PHONE_NUMBER="6475687414"

  before :all do
    @twilio||= TwilioHandler.new
    @twilio.authenticate(TwilioHandler.run_as_test)
    @twilio.initiate_instance
  end

  describe "creates twilio instance" do
    it "correctly authenticates instance" do

      expect(@twilio.client).not_to be_nil

    end
  end

  describe "#send message" do
    it "sets the client status as 'queued' for sending test message" do
      result = @twilio.send_message(TO_PHONE_NUMBER,'TEST MESSAGE')

      expect(result.status.to_s).to eql('queued')
    end

    it "raises exception if twilio is not authenticated" do
      twilio_obj = TwilioHandler.new
      expect{twilio_obj.send_message(TO_PHONE_NUMBER,'TEST MESSAGE')}.to raise_error(Exception)
    end

    it "successfully sends incoming message as SMS" do
      @twilio.authenticate(TwilioHandler.run_as_dev)
      @twilio.initiate_instance
      allow(@twilio).to receive(:send_message).with(TO_PHONE_NUMBER,'TEST MESSAGE')

    end
  end


end
