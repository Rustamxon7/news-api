require 'rails_helper'

RSpec.describe Kun::Parser::ParseNewsList, type: :model do
  describe 'parse news list' do
    let(:url) { 'kun.uz/en/news/category/tech' }
    let(:news_list) { Kun::Parser::ParseNewsList.new(url) }

    it 'should return array of news' do
      expect(news_list).to be_a(Kun::Parser::ParseNewsList)
    end

    it 'should return array of news' do
      expect(news_list.parse).to be_a(Array)
    end
  end
end
