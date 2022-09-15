class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.string :source
      t.string :description
      t.string :image_url
      t.datetime :published_at

      t.timestamps
    end
  end
end
