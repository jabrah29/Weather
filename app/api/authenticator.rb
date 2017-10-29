require 'envyable'

module Authenticator

  @account_sid = ''
  @auth_token = ''

  def self.authenticate_test_environment
    Envyable.load('./config/env.yml', 'test')
    set_credentials(ENV['TWILIO_ACCOUNT_SID'],ENV['TWILIO_AUTH_TOKEN'])
  end

  def self.authenticate_dev_environment
    Envyable.load('./config/env.yml', 'development')
    set_credentials(ENV['TWILIO_ACCOUNT_SID'],ENV['TWILIO_AUTH_TOKEN'])
  end

  def self.set_credentials(key,auth_token)
    @account_sid = key
    @auth_token = auth_token
  end

  def self.account_sid
    @account_sid
  end

  def self.auth_token
    @auth_token
  end


end