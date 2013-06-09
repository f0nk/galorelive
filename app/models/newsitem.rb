class Newsitem < ActiveRecord::Base
	belongs_to :film
	has_many :images
	has_many :videos
  # attr_accessible :title, :body
end
