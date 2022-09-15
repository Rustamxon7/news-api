require 'rails_helper'

RSpec.describe Cnet::Parser::ParseNewsList, type: :model do
  describe 'parse news list' do
    let(:url) { 'www.cnet.com/news/' }
    let(:news_list) { Cnet::Parser::ParseNewsList.new(url) }

    it 'should return array of news' do
      expect(news_list).to be_a(Cnet::Parser::ParseNewsList)
    end

    it 'should return array of news' do
      expect(news_list.parse).to be_a(Array)
    end
  end
end
