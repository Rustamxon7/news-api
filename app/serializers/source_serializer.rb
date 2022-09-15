class SourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :source, :description, :image_url, :published_at  
  
  def description
    object.description.truncate(100)
  end

  def source
    source = object.source
    source = source.gsub('https://', '')
    source = source.gsub(/\/.*/, '')
    source = source.gsub('www.', '')
    source = source.gsub('storage.kun.uz', 'kun.uz')
    source = source.gsub('cdn.vox-cdn.com', 'vox.com')
  end

  
  def url
    if object.url.start_with? '/en/news'
      object.url = 'https://kun.uz' + object.url
      object.save
    elsif object.url.start_with? '/tech' or object.url.start_with? '/deals'
      object.url = 'https://www.cnet.com' + object.url
      object.save
    end
    object.url
  end
end