require "byebug"
require_relative '../app/api/message_builder'

describe MessageBuilder do

  before :all do
    @message_builder = MessageBuilder.new
  end

  describe '#report_description' do
    it 'returns rain message based on incoming description' do
      result = @message_builder.report_description('Showers')
      expect(result).to eq('Expect rain 🌧 ☂')
    end

    it 'returns sunny message based on incoming description' do
      result = @message_builder.report_description('Mostly Sunny')
      expect(result).to eq('Sunny!🕶 ☀')
    end

    it 'returns cloudy message based on incoming description' do
      result = @message_builder.report_description('Cloudy')
      expect(result).to eq('Cloudy ☁ 😞')
    end

    it 'returns stormy message based on incoming description' do
      result = @message_builder.report_description('Scattered Thunderstorms')
      expect(result).to eq('Storming ⚡ 🌩')
    end
  end

  describe '#generate_daily_message' do
    it 'returns daily message to be sent as text' do
      params = {
        :current_tempF => '50',
        :current_tempC => '21',
        :description => 'Partly Sunny',
        :current_precipitation => '45%'
      }
      message = @message_builder.generate_daily_message(params)
      byebug
    end
  end

end
