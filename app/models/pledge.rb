class Pledge < ActiveRecord::Base
	belongs_to :backer, class_name: 'User'
	belongs_to :reward

	def project
		self.reward.project
	end
end
