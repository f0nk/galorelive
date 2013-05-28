class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
	t.string :image_type
	t.string :amazon_image_url
	t.string :large_size
	t.string :large_link
	t.string :medium_size
	t.string :medium_link
	t.string :small_size
	t.string :small_link
	t.string :aspect_ratio
	t.string :image_source

    t.timestamps
    end
  end
end