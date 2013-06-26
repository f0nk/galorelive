class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
    t.integer :newsitem_id
    t.string :video_title
    t.string :video_link
    t.string :video_type

    t.timestamps
    end
  end

  def down
	drop_table :videos	  
  end
end
