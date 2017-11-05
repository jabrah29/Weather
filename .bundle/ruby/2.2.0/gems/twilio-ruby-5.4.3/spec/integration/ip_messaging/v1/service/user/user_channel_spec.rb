##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'UserChannel' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .users("USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .user_channels.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://ip-messaging.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "channels"
          },
          "channels": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "member_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "joined",
                  "last_consumed_message_index": 5,
                  "unread_messages_count": 5,
                  "links": {
                      "channel": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "member": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .users("USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .user_channels.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "channels"
          },
          "channels": []
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .users("USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .user_channels.list()

    expect(actual).to_not eq(nil)
  end
end