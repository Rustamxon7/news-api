require_relative '../sources/kun'
require_relative '../sources/vox'
require_relative '../sources/cnet'
require_relative '../sources/technewsworld'

module SourceScraper
  KUN_URL = 'kun.uz/en/news/category/tech'.freeze
  VOX_URL = 'www.vox.com/recode'.freeze
  CNET_URL = 'www.cnet.com/tech'.freeze
  TECHNEWSWORLD_URL = 'www.technewsworld.com/section/it'.freeze

  def self.scrape(url)
    case url
    when KUN_URL
      parse_list = Kun::Parser::ParseNewsList.new(url)
    when VOX_URL
      parse_list = Vox::Parser::ParseNewsList.new(url)
    when CNET_URL
      parse_list = Cnet::Parser::ParseNewsList.new(url)
    when TECHNEWSWORLD_URL
      parse_list = TechNewsWorld::Parser::ParseNewsList.new(url)
    end

    Source.create(parse_list.parse)
  end

  def self.scrape_all
    scrape(KUN_URL)
    scrape(VOX_URL)
    scrape(CNET_URL)
    scrape(TECHNEWSWORLD_URL)
  end
end
