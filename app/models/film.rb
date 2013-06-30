class Film < ActiveRecord::Base
	has_many :newsitems, :dependent => :destroy
	has_many :images, :through => :newsitems
end
