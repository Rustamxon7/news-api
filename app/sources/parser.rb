class ReusableNokogiri
  BASE_URL = 'https://'
  DATE_REGEX = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/

  # Formats
  IMG_SRC = 'src'
  DATETIME = 'datetime'
  HREF = 'href'
  HTTP = 'http'
  

  def initialize(news_item, title, link, image, text)
    @news_item = news_item
    @title = title
    @link = link
    @image = image
    @text = text
  end

  def parse
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

    doc = Nokogiri::HTML(URI.open(BASE_URL + @url))
    doc.css(@news_item).map do |product|
      {
        title: title(product),
        url: link(product),
        image_url: image(product),
        published_at: Time.now, 
        description: text(product),
        source: source(product)
      }
    end
  end
end