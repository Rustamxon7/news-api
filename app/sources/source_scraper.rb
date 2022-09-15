require_relative '../sources/kun'
require_relative '../sources/vox'
require_relative '../sources/cnet'
require_relative '../sources/technewsworld'


module SourceScraper
  KUN_URL = 'kun.uz/en/news/category/tech'
  VOX_URL = 'www.vox.com/recode'
  CNET_URL = 'www.cnet.com/tech'
  TECHNEWSWORLD_URL = 'www.technewsworld.com/section/it'

  def self.scrape(url)
    case url
    when KUN_URL
      parseList = Kun::Parser::ParseNewsList.new(url)
    when VOX_URL
      parseList = Vox::Parser::ParseNewsList.new(url)
    when CNET_URL
      parseList = Cnet::Parser::ParseNewsList.new(url)
    when TECHNEWSWORLD_URL
      parseList = TechNewsWorld::Parser::ParseNewsList.new(url)
    end

    Source.create(parseList.parse)
  end

  def self.scrape_all
    scrape(KUN_URL)
    scrape(VOX_URL)
    scrape(CNET_URL)
    scrape(TECHNEWSWORLD_URL)
  end
end

