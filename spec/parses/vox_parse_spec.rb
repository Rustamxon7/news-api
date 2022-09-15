require 'rails_helper'

RSpec.describe Vox::Parser::ParseNewsList, type: :model do
  describe 'parse news list' do
    let(:url) { 'www.vox.com/recode' }
    let(:news_list) { Vox::Parser::ParseNewsList.new(url) }

    it 'should return array of news' do
      expect(news_list).to be_a(Vox::Parser::ParseNewsList)
    end

    it 'should return array of news' do
      expect(news_list.parse).to be_a(Array)
    end
  end
end
