class CreateNewsitems < ActiveRecord::Migration
  def change
    create_table :newsitems do |t|

    t.string :news_source
    t.string :news_type
    t.string :url
    t.string :description
    t.string :keywords
    t.string :type

    t.timestamps
    end
  end
end
