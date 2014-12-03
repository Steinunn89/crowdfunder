class Reward < ActiveRecord::Base
	belongs_to :project
	#belongs_to :backer, through pledges, class_name: "User"
end
