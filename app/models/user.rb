class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  #has_many :owned_project, class_name:"Project" 
  
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :projects, through: :pledges

end
