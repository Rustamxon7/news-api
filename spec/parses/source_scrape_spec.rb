require 'rails_helper'

RSpec.describe SourceScraper, type: :model do
  describe 'scrape' do
    it 'should return array of news' do
      expect(SourceScraper.scrape(SourceScraper::KUN_URL)).to be_a(Array)
    end

    it 'do not return empty array' do
      expect(SourceScraper.scrape(SourceScraper::KUN_URL)).not_to be_empty
    end
  end
end