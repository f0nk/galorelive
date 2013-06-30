class Newsitem < ActiveRecord::Base
	belongs_to :film
	has_many :images, :dependent => :destroy
	has_many :videos, :dependent => :destroy
  # attr_accessible :title, :body
end
