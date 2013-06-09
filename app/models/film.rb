class Film < ActiveRecord::Base
	has_many :newsitems, :dependent => :destroy
end
