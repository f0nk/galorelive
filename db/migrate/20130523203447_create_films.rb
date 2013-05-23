class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
    
	t.integer :freebaseid
	t.integer :themoviedbid
	t.string :imdbid
	t.string :imdbscore
	t.string :imdblink
	t.string :rottentomatoesscore
	t.string :metacriticscore
	t.string :youtubetrailerlinks
	t.string :youtubecliplinks
	t.string :weekendbo
	t.string :overallbo
	t.string :Genre
	t.string :budget
	t.string :noofscreens
	t.string :season
	t.string :setting
	t.string :sequel
	t.string :rating
	No. of trailers
	Running time
	Language
	VFX
	Production year	
    
    t.timestamps

    end
  end
end
