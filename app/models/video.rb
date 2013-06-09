class Video < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :newsitem
end
