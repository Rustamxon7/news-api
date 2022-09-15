class ReusableNokogiri
  BASE_URL = 'https://'.freeze
  DATE_REGEX = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/

  # Formats
  IMG_SRC = 'src'.freeze
  DATETIME = 'datetime'.freeze
  HREF = 'href'.freeze
  HTTP = 'http'.freeze

  def initialize(news_item, title, link, image, text)
    @news_item = news_item
    @title = title
    @link = link
    @image = image
    @text = text
  end

  def title(doc)
    doc.css(@title).text
  end

  def image(doc)
    doc.css(@image).attr(IMG_SRC)
  end

  def text(doc)
    doc.css(@text).text
  end

  def link(doc)
    doc.css(@link).attr(HREF)
  end

  def source(doc)
    doc.css(@image).attr(IMG_SRC)
  end

  def parser(doc)
    {
      title: title(doc),
      url: link(doc),
      image_url: image(doc),
      published_at: Time.now,
      description: text(doc),
      source: source(doc)
    }
  end

  def parse
    doc = Nokogiri::HTML(URI.open(BASE_URL + @url))
    doc.css(@news_item).map do |product|
      parser(product)
    end
  end
end
