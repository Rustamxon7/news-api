require_relative 'parser'

module TechNewsWorld
  class Parser
    class ParseNewsList < ReusableNokogiri
      def initialize(url)
        @url = url
        @news_item = '.search-item'
        @title = '.search-txt a h2'
        @image = '.search-pic a img'
        @link = '.search-txt a'
        @text = 'p'
      end
    end
  end
end
