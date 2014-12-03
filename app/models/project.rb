class Project < ActiveRecord::Base
	#belongs_to :owner, class_name: 'User'
	#has_many: backers, through: pledges, class_name: 'User'
	has_many :rewards
	has_many :pledges
	
	accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
	
	def amount_raised
		self.pledges.sum(:amount)
	end

	def match_reward(amount)
		rewards.where(['amount <= ?', amount]).order('amount desc').first
	end

	def days_left
		((Time.now - self.end_date)/3600).round
	end


end
