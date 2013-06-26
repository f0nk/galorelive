# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130528201558) do

  create_table "films", :force => true do |t|
    t.integer  "freebase_id"
    t.integer  "the_moviedb_id"
    t.string   "imdb_id"
    t.string   "imdb_score"
    t.string   "imdb_link"
    t.string   "rotten_tomatoes_score"
    t.string   "metacritic_score"
    t.string   "youtube_trailer_links"
    t.string   "youtube_clip_links"
    t.string   "film_title"
    t.string   "weekend_BO"
    t.string   "overall_BO"
    t.string   "genre"
    t.string   "budget"
    t.string   "no_of_screens"
    t.string   "season"
    t.string   "setting"
    t.string   "sequel"
    t.string   "rating"
    t.string   "running_time"
    t.string   "language"
    t.string   "vfx"
    t.string   "production_year"
    t.string   "plot"
    t.string   "summary"
    t.string   "keywords"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "newsitem_id"
    t.string   "image_title"
    t.string   "image_type"
    t.string   "amazon_image_url"
    t.string   "large_size"
    t.string   "large_link"
    t.string   "medium_size"
    t.string   "medium_link"
    t.string   "small_size"
    t.string   "small_link"
    t.string   "aspect_ratio"
    t.string   "image_source"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "newsitems", :force => true do |t|
    t.integer  "film_id"
    t.string   "news_title"
    t.string   "news_source"
    t.string   "news_type"
    t.string   "url"
    t.string   "description"
    t.string   "keywords"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "newsitem_id"
    t.string   "video_title"
    t.string   "video_link"
    t.string   "video_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
