
module Authenticator

  API_KEY = 'TWILIO_KEY'
  AUTH_TOKEN = 'TWILIO_SECRET'
  TEST_API_KEY = 'TEST_TWILIO_KEY'
  TEST_API_SECRET = 'TEST_TWILIO_SECRET'


  def self.authenticate_test_environment
    @account_sid = ENV[TEST_API_KEY]
    @auth_token = ENV[TEST_API_SECRET]
  end

  def self.authenticate_dev_environment
    @account_sid = ENV[TWILIO_KEY]
    @auth_token = ENV[TWILIO_SECRET]
  end

  def self.account_sid
    @account_sid
  end

  def self.auth_token
    @auth_token
  end


end