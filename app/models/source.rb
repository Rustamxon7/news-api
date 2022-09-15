class Source < ApplicationRecord
  LIMIT = 5

  validates :title, :url, :image_url, presence: true
  validates :title, :url, uniqueness: true

  scope :latest, -> { order(published_at: :desc) }

  scope :random, -> { order('RANDOM()') }


  scope :website, -> (source) { where("source LIKE ?", "%#{source}%").latest }

  scope :top_five, -> {
    where("image_url LIKE ?", "%storage.kun.uz/source/thumbnails/_medium%")
    .or(where("image_url LIKE ?", "%www.cnet.com%"))
    .or(where("url LIKE ?", "%www.vox.com/recode%"))
    .or(where("url LIKE ?", "%www.technewsworld.com/section/it%"))
    .limit(LIMIT)
  }

  scope :scrape_all, -> { SourceScraper.scrape_all }
end



