require "byebug"
require_relative '../app/scrapper/page_scraper'

describe PageScraper do

  before :all do
    @page_scraper = PageScraper.new
  end

  describe "#nokogiri" do
    it "returns a Nokogiri object" do
      nokogiri_obj = @page_scraper.nokogiri
      expect(nokogiri_obj).not_to be_nil
    end
  end

  describe "#get_hourly_table" do
    it "returns a hash of times and weather report object" do
      table = @page_scraper.get_hourly_table
      expect(table).not_to be_nil

    end
  end


end