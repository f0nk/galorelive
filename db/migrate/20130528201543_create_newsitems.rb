class CreateNewsitems < ActiveRecord::Migration
  def up
    create_table :newsitems do |t|
    t.integer :film_id
    t.string :news_title
    t.string :news_source
    t.string :news_type
    t.string :url
    t.string :description
    t.string :keywords
    t.string :type

    t.timestamps
    end
  end

  def down
  	drop_table :newsitems
  end
end
