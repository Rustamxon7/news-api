require_relative 'parser'

module Vox
  class Parser
    class ParseNewsList < ReusableNokogiri
      def initialize(url)
        @url = url
        @news_item = '.c-compact-river__entry'
        @title = '.c-entry-box--compact__title'
        @image = '.c-entry-box--compact__image noscript img'
        @link = '.c-entry-box--compact__title a'
        @text = '.c-entry-box--compact__dek'
      end
    end
  end
end