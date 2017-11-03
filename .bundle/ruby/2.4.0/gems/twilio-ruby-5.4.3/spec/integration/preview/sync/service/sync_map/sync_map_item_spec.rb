##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'SyncMapItem' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_items("key").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "data": {},
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "key": "key",
          "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "revision": "revision",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key"
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_items("key").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_items("key").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_items("key").delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_items.create(key: "key", data: "{}")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Key' => "key", 'Data' => Twilio.serialize_object("{}"),}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "data": {},
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "key": "key",
          "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "revision": "revision",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key"
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_items.create(key: "key", data: "{}")

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_items.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "items": [],
          "meta": {
              "first_page_url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_items.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "items": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "created_by": "created_by",
                  "data": {},
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "key": "key",
                  "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "revision": "revision",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key"
              }
          ],
          "meta": {
              "first_page_url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_items.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_items("key").update(data: "{}")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Data' => Twilio.serialize_object("{}"),}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "data": {},
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "key": "key",
          "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "revision": "revision",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Items/key"
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_items("key").update(data: "{}")

    expect(actual).to_not eq(nil)
  end
end