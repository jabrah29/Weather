require_relative 'authenticator'
require_relative 'message_builder'
require 'twilio-ruby'


class TwilioHandler
  include Authenticator

  attr_reader :client


  def initialize
    @authenticated = false
    @from_number = nil

  end

  def initiate_instance
    return SecurityError unless @authenticated
    @client ||= Twilio::REST::Client.new Authenticator.account_sid, Authenticator.auth_token
  end

  def authenticate(dev_env = nil)
    if dev_env
      @authenticated = true
      @from_number = '18679920319'
      Authenticator.authenticate_dev_environment
    else
      @authenticated = true
      @from_number = '15005550006'
      Authenticator.authenticate_test_environment
    end
  end

  def send_message(to_number,message)

    raise Exception unless @authenticated

    begin
      result= @client.api.account.messages.create(
          :body => message,
          :to   => "+1#{to_number}",
          :from => @from_number
      )
      result.status
    rescue Exception => e
      puts "====> #{e.message}"
    end

  end


  def self.run_as_dev
    true
  end

  def self.run_as_test
    false
  end

end