require "byebug"
require_relative '../app/scrapper/page_scraper'

describe PageScraper do

  before :all do
    @page_scraper = PageScraper.new
  end

  describe "page scraper retrieves the html page" do
    it "returns an html page" do
      page = @page_scraper.html_page
      expect(page.ok?).to be_truthy
    end
  end

  describe "page scraper uses html page to create Nokogiri object" do
    it "returns a Nokogiri object" do
      page = @page_scraper.html_page
      nokogiri_obj = @page_scraper.create_nokogiri_instance(page)
      byebug
    end
  end


end