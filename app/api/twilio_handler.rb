require_relative 'authenticator'
require_relative 'message_builder'
require 'twilio-ruby'
require "byebug"


class TwilioHandler
  include Authenticator,MessageBuilder

  def initialize
    @authenticate = Authenticator.authenticate_test_environment
    @client = Twilio::REST::Client.new Authenticator.account_sid, Authenticator.auth_token
  end

  def send_test_message(to_number,message)
    return @client.messages.create(
        :body => message,
        :to   => "+1#{to_number}",
        :from => '+15005550006'
    )
  end



end