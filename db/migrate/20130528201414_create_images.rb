class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
    t.integer :newsitem_id
    t.string :image_title
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

  def down 
  	drop_table :images
  end

end
