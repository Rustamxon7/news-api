require_relative 'parser'

module Cnet
  class Parser
    class ParseNewsList < ReusableNokogiri
      def initialize(url)
        @url = url
        @news_item = '.c-universalLatest_item'
        @title = '.c-universalLatest_text h3'
        @image = '.c-universalLatest_image img'
        @link = '.c-universalLatest_text a'
        @text = '.c-universalLatest_text p'
      end
    end
  end
end
