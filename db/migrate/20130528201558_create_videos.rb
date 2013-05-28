class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    
    t.string :video_link
    t.string :video_type

    t.timestamps
    end
  end
end
