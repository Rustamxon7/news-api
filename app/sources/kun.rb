require_relative 'parser'

module Kun
  class Parser
    class ParseNewsList < ReusableNokogiri
      def initialize(url)
        @url = url
        @news_item = '.news'
        @title = '.news__title'
        @image = '.news__img img'
        @link = '.news__title'
      end
    end
  end
end