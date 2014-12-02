class Reward < ActiveRecord::Base
	belongs_to :project
	belongs_to :user, through pledges, class_name: "User"
end
