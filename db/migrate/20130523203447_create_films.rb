class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
    
	t.integer :freebase_id
	t.integer :the_moviedb_id
	t.string :imdb_id
	t.string :imdb_score
	t.string :imdb_link
	t.string :rotten_tomatoes_score
	t.string :metacritic_score
	t.string :youtube_trailer_links
	t.string :youtube_clip_links
	t.string :weekend_BO
	t.string :overall_BO
	t.string :genre
	t.string :budget
	t.string :no_of_screens
	t.string :season
	t.string :setting
	t.string :sequel
	t.string :rating
	t.string :running_time
	t.string :language
	t.string :vfx
	t.string :production_year
	t.string :plot
	t.string :summary
	t.string :keywords	
    
    t.timestamps

    end
  end
end
