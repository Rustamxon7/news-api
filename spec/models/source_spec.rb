require 'rails_helper'

RSpec.describe Source, type: :model do
  before(:each) do
    @source = Source.create!(title: 'Test title ', url: 'https://www.test.com', description: 'Test description', image_url: 'https://www.test.com/image.jpg', published_at: '2018-01-01 00:00:00')
  end

  it 'is valid with valid attributes' do
    expect(@source).to be_valid
  end

  it 'is not valid without a title' do
    @source.title = nil
    expect(@source).to_not be_valid
  end

  it 'is not valid without a url' do
    @source.url = nil
    expect(@source).to_not be_valid
  end

  it 'is not valid without an image_url' do
    @source.image_url = nil
    expect(@source).to_not be_valid
  end

  it 'checks for uniqueness of title and url' do
    source = Source.new(title: 'Test title', url: 'https://www.test.com')
    expect(source).to_not be_valid
  end

  it 'checks for uniqueness of url and title' do
    source = Source.new(title: 'Test title', url: 'https://www.test.com')
    expect(source).to_not be_valid
  end
end
